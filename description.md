# Event Agency Database

## Database Requirements

Database is made for an Event Agency which purpose is to organise and manage corporative and private events for their clients.

- It must contain all the information about clients, such as names, surnames, phone number, email, preferred type of contact. Client may be both individuals and corporative entities. For corporative entities we must additionaly know name of the company and their address.

- Suppliers or services that we utilize to organise events, e.g. to rent some place or to order some typography, are stored containing their names, addresses, type of services they provide, contact information.

- We have contracts with both suppliers and clients that we need to link to respective records in the history of events organised by our agency, which aggregates data of clients (there may be multiple customers), events information (address, timetable, description, etc), suppliers (also multiple) affiliated with event organisation. Events may have diferrent subparts at diferrent time and date. There are also diferrent type of events (PR, private, corporate, special). 

- Finally we have agents and agent teams. Events may be organised by either a team or a single agent. Besides obvious person information database should contain emloyees salary, comission. 

## Entities and connections
There is a base class "Entity" for the legal entities from which all the other (Clinet, Person, CorporativeEntity) inherit. 
Having this structure we can satisfy scenarios where Client can be both individual(Person) or corporative(CorporativeEntity).
Base entity is directly connected to the Contact, so that each entity regardless of their type can have contact information.
Agents connect with teams and AgentEntity. AgentEntity consist of both Agents and their teams, and can be connected to Event.
Clients connect to Event through EventClient.
Suppliers inherit from CorporativeEntity and store types in separate table SupplierType.
Event stores events information and connects all the necessary information about event location, type, timetable, suppliers.

## Sample functionalities
1. Find all events asociated with a specific client.
```
SELECT 
    e.name AS Event_Name,
    e.description AS Event_Description,
    a.city AS Event_City,
    a.street AS Event_Street
FROM 
    EventClient ec
JOIN 
    Event e ON ec.Event_id = e.id
JOIN 
    Address a ON e.Address_id = a.id
WHERE 
    ec.Client_Entity_id = 101;
```

2. Show suppliers and count of collaborations with them.
```
SELECT s.id AS Supplier_ID, s.SupplierType_id, COUNT(es.Event_id) AS Collaboration_Count
FROM Supplier s
LEFT JOIN EventSupplier es ON s.id = es.Supplier_id
GROUP BY s.id, s.SupplierType_id
ORDER BY Collaboration_Count DESC;
```

3. List agents with their teams and salaries.
```
SELECT 
    p.first_name AS Agent_First_Name,
    p.last_name AS Agent_Last_Name,
    at.name AS Team_Name,
    a.SAL AS Salary
FROM 
    AgentAgentTeam aat
JOIN 
    Agent a ON aat.agent_id = a.id
JOIN 
    AgentTeam at ON aat.team_id = at.id
JOIN 
    Person p ON a.id = p.id;
```

4. Find top agent/agent_teams ordered by the count of events organised.
```
SELECT 
    COALESCE(a.id, at.id) AS Organizer_ID,
    CASE 
        WHEN a.id IS NOT NULL THEN 'Agent'
        ELSE 'Agent Team'
    END AS Organizer_Type,
    COUNT(t.Event_id) AS Event_Count
FROM Timetable t
JOIN Event e ON t.Event_id = e.id
LEFT JOIN Agent a ON e.AgentEntity_id = a.AgentEntity_id
LEFT JOIN AgentTeam at ON e.AgentEntity_id = at.id
GROUP BY a.id, at.id
ORDER BY Event_Count DESC;
```

5. Find all suppliers for a specific event.
```
SELECT 
    s.id AS Supplier_ID,
    ce.name AS Supplier_Name,
    st.name AS Supplier_Type
FROM 
    EventSupplier es
JOIN 
    Supplier s ON es.Supplier_id = s.id
JOIN 
    CorporativeEntity ce ON s.id = ce.id
JOIN 
    SupplierType st ON s.SupplierType_id = st.id
WHERE 
    es.Event_id = x;
```

