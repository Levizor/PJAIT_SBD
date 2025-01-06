CREATE OR REPLACE PROCEDURE generate_event_timetable IS
    CURSOR event_cursor IS
        SELECT e.id AS event_id,
               e.name AS event_name,
               ep.id AS event_part_id,
               ep.what AS event_part_description,
               ep."when" AS event_part_time,
               ep."where" AS event_part_location
        FROM Event e
        JOIN Timetable t ON e.id = t.Event_id
        JOIN EventPart ep ON t.EventPart_id = ep.id
        ORDER BY e.id, ep."when"; 

    v_current_event_id Event.id%TYPE := NULL;
BEGIN
    DBMS_OUTPUT.ENABLE;

    FOR event_record IN event_cursor LOOP
        IF v_current_event_id IS NULL OR v_current_event_id != event_record.event_id THEN
            v_current_event_id := event_record.event_id;
            DBMS_OUTPUT.PUT_LINE('-----------------------------------');
            DBMS_OUTPUT.PUT_LINE('Event: ' || event_record.event_name);
            DBMS_OUTPUT.PUT_LINE('-----------------------------------');
        END IF;

        DBMS_OUTPUT.PUT_LINE('|');
        DBMS_OUTPUT.PUT_LINE('Event Part: ' || event_record.event_part_description);
        DBMS_OUTPUT.PUT_LINE('Time: ' || TO_CHAR(event_record.event_part_time, 'YYYY-MM-DD HH24:MI:SS'));
        DBMS_OUTPUT.PUT_LINE('Location: ' || event_record.event_part_location);
        
    END LOOP;
END generate_event_timetable;
/

EXEC generate_event_timetable;



CREATE OR REPLACE PROCEDURE update_agent_commissions_with_limit(
    p_team_id IN INTEGER,
    p_increase_percentage IN NUMBER,
    p_commission_limit IN NUMBER
) IS
    CURSOR agent_cursor IS
        SELECT a.id, a.com
        FROM Agent a
        JOIN AgentAgentTeam att ON a.id = att.agent_id
        WHERE att.team_id = p_team_id;

    v_agent_id Agent.id%TYPE;
    v_current_com Agent.com%TYPE;
    v_new_com Agent.com%TYPE;

BEGIN
    DBMS_OUTPUT.ENABLE;
    OPEN agent_cursor;
    LOOP
        FETCH agent_cursor INTO v_agent_id, v_current_com;
        EXIT WHEN agent_cursor%NOTFOUND;

        IF v_current_com >= p_commission_limit THEN
            DBMS_OUTPUT.PUT_LINE('Agent ID: ' || v_agent_id || 
                                 ' - Skipped (Current commission: ' || 
                                 v_current_com || ' exceeds limit: ' || 
                                 p_commission_limit || ')');
        ELSE
            v_new_com := v_current_com + (v_current_com * p_increase_percentage / 100);

            UPDATE Agent
            SET com = v_new_com
            WHERE id = v_agent_id;
            DBMS_OUTPUT.PUT_LINE('Updated comission for' || v_agent_id || '. New value is: ' || v_new_com);

        END IF;
    END LOOP;

    CLOSE agent_cursor;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
END; 
/

select * from Agent;
EXEC update_agent_commissions_with_limit(4, 10, 8000);
select * from Agent;


CREATE OR REPLACE TRIGGER Event_full_deletion
AFTER DELETE ON Event
FOR EACH ROW
DECLARE
    CURSOR c_contracts IS
        SELECT Contract_id
        FROM EventContract
        WHERE Event_id = :OLD.id;

    CURSOR c_suppliers IS
        SELECT Supplier_id
        FROM EventSupplier
        WHERE Event_id = :OLD.id;

    CURSOR c_timetable IS
        SELECT EventPart_id
        FROM Timetable
        WHERE Event_id = :OLD.id;

    v_contract_id INTEGER;
    v_supplier_id INTEGER;
    v_event_part_id INTEGER;
BEGIN
    -- contracts
    OPEN c_contracts;
    LOOP
        FETCH c_contracts INTO v_contract_id;
        EXIT WHEN c_contracts%NOTFOUND;
        DELETE FROM EventContract
        WHERE Contract_id = v_contract_id;
    END LOOP;
    CLOSE c_contracts;

    -- timetable
    OPEN c_timetable;
    LOOP
        FETCH c_timetable INTO v_event_part_id;
        EXIT WHEN c_timetable%NOTFOUND;
        DELETE FROM Timetable
        WHERE EventPart_id = v_event_part_id AND Event_id = :OLD.id;
    END LOOP;
    CLOSE c_timetable;
    DELETE FROM EventPart
    WHERE id IN 
        (SELECT EventPart_id
         FROM Timetable
         WHERE Event_id = :OLD.id);

    -- eventClient
    DELETE FROM EventClient
    WHERE Event_id = :OLD.id;

END;
/


CREATE OR REPLACE TRIGGER Client_full_deletion
AFTER DELETE ON Client
FOR EACH ROW
DECLARE
    CURSOR c_contracts IS
        SELECT Contract_id
        FROM EventContract
        WHERE Event_id IN 
            (SELECT Event_id
             FROM EventClient
             WHERE Client_Entity_id = :OLD.Entity_id);

    CURSOR c_events IS
        SELECT Event_id
        FROM EventClient
        WHERE Client_Entity_id = :OLD.Entity_id;

    v_contract_id INTEGER;
    v_event_id INTEGER;
BEGIN

    -- events
    OPEN c_events;
    LOOP
        FETCH c_events INTO v_event_id;
        EXIT WHEN c_events%NOTFOUND;
        DELETE FROM Event
        WHERE id = v_event_id;
    END LOOP;
    CLOSE c_events;

    -- remove corporative
    DELETE FROM CorporativeEntity
    WHERE id = :OLD.Entity_id;

    -- remove private
    DELETE FROM Person
    WHERE id = :OLD.Entity_id;

    -- remove address
    DELETE FROM Address
    WHERE id = 
        (SELECT Address_id
         FROM CorporativeEntity
         WHERE id = :OLD.Entity_id);
        
END;
/

select * from Event e 
join EventClient ec on ec.Event_id = e.id
join Client c on ec.Client_Entity_id = c.Entity_id
where c.Entity_id = 6;

DELETE FROM Client
WHERE Entity_id = 6;

select * from Event e 
join EventClient ec on ec.Event_id = e.id
join Client c on ec.Client_Entity_id = c.Entity_id
where c.Entity_id = 6;
