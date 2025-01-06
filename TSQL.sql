CREATE TRIGGER UpdateAgentCabinet
ON Agent
AFTER INSERT
AS
BEGIN
    DECLARE @NewCabinetNumber INT;
    DECLARE @AgentEntityId INT;


    SELECT @AgentEntityId = AgentEntity_id FROM inserted;

        
    SELECT @NewCabinetNumber = (ISNULL(MAX(cabinet_number), 0) + 1)
    FROM AgentEntity ae
    WHERE NOT EXISTS(SELECT * FROM AgentTeam at where at.id = ae.id);

    UPDATE AgentEntity
    SET cabinet_number = @NewCabinetNumber
    WHERE id = @AgentEntityId;


END;

CREATE TRIGGER AddAgentToTheSmallestTeam
ON Agent
AFTER INSERT
AS
BEGIN
    DECLARE @AgentId INT;
    DECLARE @TeamId INT;

    SELECT @AgentId = id FROM inserted;

    SELECT TOP 1 @TeamId = Team_id
    FROM AgentAgentTeam
    GROUP BY Team_id
    ORDER BY COUNT(agent_id) ASC;

    INSERT INTO AgentAgentTeam (agent_id, team_id)
    VALUES (@AgentId, @TeamId);
    
END;

INSERT INTO AgentEntity(id, cabinet_number) VALUES 
  (7, 0);
INSERT INTO AGENT(ID, AgentEntity_id, SAL, COM) VALUES 
  (4, 7, 5000, 3000);

select * from AgentEntity;
select * from AgentAgentTeam 
where agent_id = 4;

-- Iterate over events and show clients and suppliers
CREATE PROCEDURE ListEventParticipants
AS
BEGIN
    DECLARE @EventId INT;
    DECLARE @EventName NVARCHAR(50);
    DECLARE @ClientId INT;
    DECLARE @ClientName NVARCHAR(100);
    DECLARE @SupplierId INT;
    DECLARE @SupplierName NVARCHAR(100);
    
    -- Cursor for events
    DECLARE EventCursor CURSOR FOR
        SELECT id, name
        FROM Event;

    OPEN EventCursor;
    FETCH NEXT FROM EventCursor INTO @EventId, @EventName;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT 'Event ID: ' + CAST(@EventId AS NVARCHAR);
        PRINT 'Event Name: ' + @EventName;

        DECLARE CorporativeClientCursor CURSOR FOR
            SELECT C.Entity_id, CE.name
            FROM EventClient EC
            INNER JOIN Client C ON EC.Client_Entity_id = C.Entity_id
            INNER JOIN CorporativeEntity CE ON C.Entity_id = CE.id
            WHERE EC.Event_id = @EventId;

        DECLARE PrivateClientCursor CURSOR FOR
            SELECT C.Entity_id, P.first_name + ' ' + P.last_name
            FROM EventClient EC
            INNER JOIN Client C ON EC.Client_Entity_id = C.Entity_id
            INNER JOIN Person P ON C.Entity_id = P.id
            WHERE EC.Event_id = @EventId;

        -- Inner cursr for corporative clients
        OPEN CorporativeClientCursor;
        FETCH NEXT FROM CorporativeClientCursor INTO @ClientId, @ClientName;
        IF @@FETCH_STATUS = 0
        BEGIN
            PRINT '  Clients:';
        END

        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT '    - Client ID: ' + CAST(@ClientId AS NVARCHAR) + ', Name: ' + @ClientName;
            FETCH NEXT FROM CorporativeClientCursor INTO @ClientId, @ClientName;
        END

        CLOSE CorporativeClientCursor;
        DEALLOCATE CorporativeClientCursor;

        -- Inner cursor for private clients
        OPEN PrivateClientCursor;
        FETCH NEXT FROM PrivateClientCursor INTO @ClientId, @ClientName;
        IF @@FETCH_STATUS = 0
        BEGIN
            PRINT '  Clients:';
        END

        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT '    - Client ID: ' + CAST(@ClientId AS NVARCHAR) + ', Name: ' + @ClientName;
            FETCH NEXT FROM PrivateClientCursor INTO @ClientId, @ClientName;
        END

        CLOSE PrivateClientCursor;
        DEALLOCATE PrivateClientCursor;

        -- Inner cursor for Suppliers
        DECLARE SupplierCursor CURSOR FOR
            SELECT S.id, CE.name
            FROM EventSupplier ES
            INNER JOIN Supplier S ON ES.Supplier_id = S.id
            INNER JOIN CorporativeEntity CE ON S.id = CE.id
            WHERE ES.Event_id = @EventId;

        -- SupplierCursor
        OPEN SupplierCursor;

        FETCH NEXT FROM SupplierCursor INTO @SupplierId, @SupplierName;

        IF @@FETCH_STATUS = 0
        BEGIN
            PRINT '  Suppliers:';
        END

        WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT '    - Supplier ID: ' + CAST(@SupplierId AS NVARCHAR) + ', Name: ' + @SupplierName;
            FETCH NEXT FROM SupplierCursor INTO @SupplierId, @SupplierName;
        END

        CLOSE SupplierCursor;
        DEALLOCATE SupplierCursor;

        FETCH NEXT FROM EventCursor INTO @EventId, @EventName;
    END

    CLOSE EventCursor;
    DEALLOCATE EventCursor;
END;

EXEC ListEventParticipants;


-- Procedure to print clients contacts that are prefferred 
CREATE PROCEDURE GetPreferredContactForEvent
    @EventId INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ClientEntityId INT;
    DECLARE @PreferredContactType NVARCHAR(50);
    DECLARE @ContactId INT;
    DECLARE @PhoneNumber NVARCHAR(10);
    DECLARE @Email NVARCHAR(50);
    DECLARE @FullName NVARCHAR(200);

    DECLARE ClientCursor CURSOR FOR
        SELECT EC.Client_Entity_id
        FROM EventClient EC
        WHERE EC.Event_id = @EventId;

    OPEN ClientCursor;
    FETCH NEXT FROM ClientCursor INTO @ClientEntityId;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT 
            @PhoneNumber = C.phone_number, 
            @Email = C.email, 
            @PreferredContactType = PCT.type
        FROM Contact C
        INNER JOIN Entity E ON C.id = E.Contact_id
        INNER JOIN PrefferedContactType PCT ON PCT.id = C.PrefferedContactType_id
        WHERE E.id = @ClientEntityId;

        IF EXISTS (SELECT 1 FROM Person P WHERE P.id = @ClientEntityId)
        BEGIN
            SELECT @FullName = P.first_name + ' ' + P.last_name
            FROM Person P
            WHERE P.id = @ClientEntityId;
        END
        ELSE IF EXISTS (SELECT 1 FROM CorporativeEntity CE WHERE CE.id = @ClientEntityId)
        BEGIN
            SELECT @FullName = CE.name
            FROM CorporativeEntity CE
            WHERE CE.id = @ClientEntityId;
        END

        IF @PreferredContactType = 'Email'
        BEGIN
            PRINT @FullName + ' prefers contacting by Email. Email: ' + @Email;
        END
        ELSE IF @PreferredContactType = 'Phone'
        BEGIN
            PRINT @FullName + ' prefers contacting by Phone. Phone Number: ' + @PhoneNumber;
        END
        ELSE IF @PreferredContactType = 'SMS'
        BEGIN
            PRINT @FullName + ' prefers contacting by SMS. Phone Number: ' + @PhoneNumber;
        END
        ELSE
        BEGIN
            PRINT @FullName + ' has no preferred contact type.';
        END

        FETCH NEXT FROM ClientCursor INTO @ClientEntityId;
    END

    CLOSE ClientCursor;
    DEALLOCATE ClientCursor;
END;


EXEC GetPreferredContactForEvent @EventId = 4;
