-- Insert data into Address table
INSERT ALL
  INTO Address (id, city, street, building, add_info) VALUES (1, 'Poznan', '5th Ave', '101', 'Near Central Park')
  INTO Address (id, city, street, building, add_info) VALUES (2, 'Gdansk', 'Sunset Blvd', '202', 'Close to Hollywood')
  INTO Address (id, city, street, building, add_info) VALUES (3, 'Warsaw', 'Michigan Ave', '303', 'Next to Millennium Park')
  INTO Address (id, city, street, building, add_info) VALUES (4, 'Gdansk', 'Ocean Drive', '404', 'Near South Beach')
  INTO Address (id, city, street, building, add_info) VALUES (5, 'Krakow', 'Market St', '505', 'Near Ferry Building')
  INTO Address (id, city, street, building, add_info) VALUES (6, 'Lublin', 'Congress Ave', '606', 'Downtown Austin')
  INTO Address (id, city, street, building, add_info) VALUES (7, 'Gdynia', 'Pine St', '707', 'Near Pike Place Market')
  INTO Address (id, city, street, building, add_info) VALUES (8, 'Warsaw', 'Newbury St', '808', 'In the Back Bay area')
  INTO Address (id, city, street, building, add_info) VALUES (9, 'Warsaw', 'Staszica', '55', 'Entrance is next to the Grocery shop.')
  INTO Address (id, city, street, building, add_info) VALUES (10, 'Lublin', 'Newbury St', '809', 'Near the ABC river')
  INTO Address (id, city, street, building, add_info) VALUES (11, 'Gdansk', 'Wrzeszcz', '809', 'Next to the Wrzeszcz station')
SELECT * FROM dual;

-- Insert data into PrefferedContactType table
INSERT ALL
  INTO PrefferedContactType (id, type) VALUES (1, 'Phone')
  INTO PrefferedContactType (id, type) VALUES (2, 'Email')
  INTO PrefferedContactType (id, type) VALUES (3, 'SMS')
SELECT * FROM dual;

-- Insert data into Contact table
INSERT ALL
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (1, '5551234567', 'john.doe@example.com', 1)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (2, '5552345678', 'jane.smith@example.com', 2)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (3, '5553456789', 'michael.johnson@example.com', 1)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (4, '5554567890', 'emily.davis@example.com', 3)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (5, '5555678901', 'david.martinez@example.com', 2)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (6, '5556789012', 'sarah.taylor@example.com', 3)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (7, '5557890123', 'james.brown@example.com', 1)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (8, '5558901234', 'mary.wilson@example.com', 2)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (9, '113445789', 'tix@tix.com', 3)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (10, '555666778', 'apple@apple.com', 1)
  INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES (11, '789794568', 'typo@gmail.com', 2)
SELECT * FROM dual;

-- Insert data into Entity table
INSERT ALL
  INTO Entity (id, Contact_id, registration_date) VALUES (1, 1, TO_DATE('2022-08-25', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (2, 2, TO_DATE('2023-01-15', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (3, 3, TO_DATE('2021-06-10', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (4, 4, TO_DATE('2020-02-20', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (5, 5, TO_DATE('2019-12-30', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (6, 6, TO_DATE('2022-03-01', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (7, 7, TO_DATE('2023-06-15', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (8, 8, TO_DATE('2024-07-04', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (9, 9, TO_DATE('2020-08-01', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (10, 10, TO_DATE('2021-04-12', 'YYYY-MM-DD'))
  INTO Entity (id, Contact_id, registration_date) VALUES (11, 11, TO_DATE('2019-08-15', 'YYYY-MM-DD'))
SELECT * FROM dual;

-- Insert data into Person table
INSERT ALL
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (1, 'John', 'Doe', TO_DATE('1985-03-25', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (2, 'Jane', 'Smith', TO_DATE('1990-07-15', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (3, 'Michael', 'Johnson', TO_DATE('1982-11-30', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (4, 'Emily', 'Davis', TO_DATE('1995-05-21', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (5, 'David', 'Martinez', TO_DATE('1980-08-10', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (6, 'Sarah', 'Taylor', TO_DATE('1992-12-05', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (7, 'James', 'Brown', TO_DATE('1987-01-13', 'YYYY-MM-DD'))
  INTO Person (id, first_name, last_name, date_of_birth) VALUES (8, 'Mary', 'Wilson', TO_DATE('1998-10-30', 'YYYY-MM-DD'))
SELECT * FROM dual;

-- Insert data into AgentEntity table
INSERT ALL
  INTO AgentEntity (id, cabinet_number) VALUES (1, 101)
  INTO AgentEntity (id, cabinet_number) VALUES (2, 102)
  INTO AgentEntity (id, cabinet_number) VALUES (3, 103)
  INTO AgentEntity (id, cabinet_number) VALUES (4, 201)
  INTO AgentEntity (id, cabinet_number) VALUES (5, 202)
SELECT * FROM dual;

-- Insert data into Agent table
INSERT ALL
  INTO Agent (id, AgentEntity_id, SAL, COM) VALUES (1, 1, 50000, 3000)
  INTO Agent (id, AgentEntity_id, SAL, COM) VALUES (2, 2, 55000, 4000)
  INTO Agent (id, AgentEntity_id, SAL, COM) VALUES (3, 3, 60000, 3500)
SELECT * FROM dual;

-- Insert data into AgentTeam table
INSERT ALL
  INTO AgentTeam (id, name, creation_date) VALUES (4, 'Team Alpha', TO_DATE('2020-01-01', 'YYYY-MM-DD'))
  INTO AgentTeam (id, name, creation_date) VALUES (5, 'Team Beta', TO_DATE('2021-06-01', 'YYYY-MM-DD'))
SELECT * FROM dual;

-- Insert data into AgentAgentTeam table
INSERT ALL
  INTO AgentAgentTeam (agent_id, team_id) VALUES (1, 4)
  INTO AgentAgentTeam (agent_id, team_id) VALUES (2, 4)
  INTO AgentAgentTeam (agent_id, team_id) VALUES (1, 5)
  INTO AgentAgentTeam (agent_id, team_id) VALUES (3, 5)
SELECT * FROM dual;

-- Insert data into CorporativeEntity table
INSERT ALL
  INTO CorporativeEntity (id, name, tax_id, Address_id) VALUES (9, 'TIX Corporation', 'abcd04564', 9)
  INTO CorporativeEntity (id, name, tax_id, Address_id) VALUES (10, 'Apple', 'tti4578aa', 10)
  INTO CorporativeEntity (id, name, tax_id, Address_id) VALUES (11, 'Typography', 'xxoa44489', 11)
SELECT * FROM dual;

-- Insert data into SupplierType table
INSERT ALL
  INTO SupplierType (id, name) VALUES (1, 'Catering')
  INTO SupplierType (id, name) VALUES (2, 'Technology')
  INTO SupplierType (id, name) VALUES (3, 'Logistics')
  INTO SupplierType (id, name) VALUES (4, 'Entertainment')
  INTO SupplierType (id, name) VALUES (5, 'Security')
  INTO SupplierType (id, name) VALUES (6, 'Decorations')
  INTO SupplierType (id, name) VALUES (7, 'Printing')
  INTO SupplierType (id, name) VALUES (8, 'AV Equipment')
SELECT * FROM dual;

-- Insert data into Supplier table
INSERT ALL
  INTO Supplier (id, SupplierType_id) VALUES (11, 7)
SELECT * FROM dual;

-- Insert data into Client table
INSERT ALL
  INTO Client (Entity_id, billing_address) VALUES (4, 4)
  INTO Client (Entity_id, billing_address) VALUES (5, 5)
  INTO Client (Entity_id, billing_address) VALUES (6, 6)
  INTO Client (Entity_id, billing_address) VALUES (7, 7)
  INTO Client (Entity_id, billing_address) VALUES (8, 8)
  INTO Client (Entity_id, billing_address) VALUES (9, 9)
  INTO Client (Entity_id, billing_address) VALUES (10, 10)
SELECT * FROM dual;

-- Insert data into Contract table
INSERT ALL
  INTO Contract (id, Entity_id, document, short_description) VALUES (1, 1, 'Contract1.pdf', 'Service agreement for client A')
  INTO Contract (id, Entity_id, document, short_description) VALUES (2, 2, 'Contract2.pdf', 'Service agreement for client B')
  INTO Contract (id, Entity_id, document, short_description) VALUES (3, 3, 'Contract3.pdf', 'Service agreement for client C')
  INTO Contract (id, Entity_id, document, short_description) VALUES (4, 4, 'Contract4.pdf', 'Service agreement for client D')
  INTO Contract (id, Entity_id, document, short_description) VALUES (5, 5, 'Contract5.pdf', 'Service agreement for client E')
  INTO Contract (id, Entity_id, document, short_description) VALUES (6, 6, 'Contract6.pdf', 'Service agreement for client F')
  INTO Contract (id, Entity_id, document, short_description) VALUES (7, 7, 'Contract7.pdf', 'Service agreement for client G')
  INTO Contract (id, Entity_id, document, short_description) VALUES (8, 8, 'Contract8.pdf', 'Service agreement for client H')
  INTO Contract (id, Entity_id, document, short_description) VALUES (9, 9, 'Contract1.pdf', 'Service agreement for client A')
  INTO Contract (id, Entity_id, document, short_description) VALUES (10, 10, 'Contract2.pdf', 'Service agreement for suplier ')
  INTO Contract (id, Entity_id, document, short_description) VALUES (11, 11, 'Contract3.pdf', 'Service agreement for suplier ')
  INTO Contract (id, Entity_id, document, short_description) VALUES (12, 11, 'Contract4.pdf', 'Service agreement for suplier ')
  INTO Contract (id, Entity_id, document, short_description) VALUES (13, 11, 'Contract5.pdf', 'Service agreement for suplier ')
  INTO Contract (id, Entity_id, document, short_description) VALUES (14, 11, 'Contract6.pdf', 'Service agreement for suplier ')
SELECT * FROM dual;


-- Insert data into EventType table
INSERT ALL
    INTO EventType (id, name) VALUES (1, 'Conference')
    INTO EventType (id, name) VALUES (2, 'Workshop')
    INTO EventType (id, name) VALUES (3, 'Seminar')
    INTO EventType (id, name) VALUES (4, 'Webinar')
    INTO EventType (id, name) VALUES (5, 'Trade Show')
    INTO EventType (id, name) VALUES (6, 'Networking Event')
    INTO EventType (id, name) VALUES (7, 'Product Launch')
    INTO EventType (id, name) VALUES (8, 'Training')
SELECT * FROM dual;

-- Insert data into Event table
INSERT ALL
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (1, 'Tech Conference', 'A conference about the latest in technology.', 1, 1, 1)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (2, 'Marketing Workshop', 'A workshop focused on digital marketing strategies.', 2, 2, 2)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (3, 'Leadership Seminar', 'A seminar on leadership and team management.', 3, 3, 3)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (4, 'Online Marketing Webinar', 'A webinar on effective online marketing techniques.', 4, 1, 4)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (5, 'Tech Trade Show', 'A trade show showcasing tech companies.', 5, 2, 5)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (6, 'Business Networking', 'A networking event for entrepreneurs and investors.', 6, 4, 6)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (7, 'Product Launch Event', 'Launch event for a new software product.', 7, 5, 7)
    INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES (8, 'Corporate Training', 'A training session for corporate employees.', 8, 4, 8)
SELECT * FROM dual;

-- Insert data into EventClient table
INSERT ALL
    INTO EventClient (Client_Entity_id, Event_id) VALUES (4, 1)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (5, 2)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (6, 3)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (7, 4)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (8, 5)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (9, 6)
    INTO EventClient (Client_Entity_id, Event_id) VALUES (10, 7)
SELECT * FROM dual;

-- Insert data into EventContract table
INSERT ALL
    INTO EventContract (Contract_id, Event_id) VALUES (1, 1)
    INTO EventContract (Contract_id, Event_id) VALUES (2, 2)
    INTO EventContract (Contract_id, Event_id) VALUES (3, 3)
    INTO EventContract (Contract_id, Event_id) VALUES (4, 4)
    INTO EventContract (Contract_id, Event_id) VALUES (5, 5)
    INTO EventContract (Contract_id, Event_id) VALUES (6, 6)
    INTO EventContract (Contract_id, Event_id) VALUES (7, 7)
    INTO EventContract (Contract_id, Event_id) VALUES (8, 8)
    INTO EventContract (Contract_id, Event_id) VALUES (9, 6)
    INTO EventContract (Contract_id, Event_id) VALUES (11, 3)
    INTO EventContract (Contract_id, Event_id) VALUES (10, 4)
    INTO EventContract (Contract_id, Event_id) VALUES (12, 5)
    INTO EventContract (Contract_id, Event_id) VALUES (13, 6)
    INTO EventContract (Contract_id, Event_id) VALUES (14, 1)
SELECT * FROM dual;

-- Insert data into EventSupplier table
INSERT ALL
    INTO EventSupplier (Event_id, Supplier_id) VALUES (1, 11)
    INTO EventSupplier (Event_id, Supplier_id) VALUES (2, 11)
    INTO EventSupplier (Event_id, Supplier_id) VALUES (3, 11)
    INTO EventSupplier (Event_id, Supplier_id) VALUES (5, 11)
SELECT * FROM dual;

-- Insert EventParts for Event 1: Tech Industry Conference
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (1, 'Speech by AI Specialist', TO_TIMESTAMP('2024-12-28 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Conference Room')
    INTO EventPart (id, what, "when", "where") VALUES (2, 'Cybersecurity Workshop', TO_TIMESTAMP('2024-12-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Workshop Room A')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (1, 1)
    INTO Timetable (EventPart_id, Event_id) VALUES (2, 1)
SELECT * FROM dual;

-- Insert EventParts for Event 2: Cooking Competition
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (3, 'Cooking Competition', TO_TIMESTAMP('2024-12-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Kitchen Arena')
    INTO EventPart (id, what, "when", "where") VALUES (4, 'Award Ceremony', TO_TIMESTAMP('2024-12-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Stage Area')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (3, 2)
    INTO Timetable (EventPart_id, Event_id) VALUES (4, 2)
SELECT * FROM dual;

-- Insert EventParts for Event 3: Music Festival
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (5, 'Opening Concert', TO_TIMESTAMP('2024-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Stage')
    INTO EventPart (id, what, "when", "where") VALUES (6, 'Rock Band Performance', TO_TIMESTAMP('2024-12-28 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Stage')
    INTO EventPart (id, what, "when", "where") VALUES (7, 'DJ Set', TO_TIMESTAMP('2024-12-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dance Floor')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (5, 3)
    INTO Timetable (EventPart_id, Event_id) VALUES (6, 3)
    INTO Timetable (EventPart_id, Event_id) VALUES (7, 3)
SELECT * FROM dual;

-- Insert EventParts for Event 4: Business Networking
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (8, 'Networking Breakfast', TO_TIMESTAMP('2024-12-28 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lobby Area')
    INTO EventPart (id, what, "when", "where") VALUES (9, 'Industry Leaders Panel', TO_TIMESTAMP('2024-12-28 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Conference Room B')
    INTO EventPart (id, what, "when", "where") VALUES (10, 'Lunch Break', TO_TIMESTAMP('2024-12-28 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dining Area')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (8, 4)
    INTO Timetable (EventPart_id, Event_id) VALUES (9, 4)
    INTO Timetable (EventPart_id, Event_id) VALUES (10, 4)
SELECT * FROM dual;

-- Insert EventParts for Event 5: Art Exhibition
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (11, 'Opening Ceremony', TO_TIMESTAMP('2024-12-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Gallery Entrance')
    INTO EventPart (id, what, "when", "where") VALUES (12, 'Sculpture Display', TO_TIMESTAMP('2024-12-28 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exhibit Hall A')
    INTO EventPart (id, what, "when", "where") VALUES (13, 'Painting Showcase', TO_TIMESTAMP('2024-12-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Exhibit Hall B')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (11, 5)
    INTO Timetable (EventPart_id, Event_id) VALUES (12, 5)
    INTO Timetable (EventPart_id, Event_id) VALUES (13, 5)
SELECT * FROM dual;

-- Insert EventParts for Event 6: Science Fair
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (14, 'Keynote Speech', TO_TIMESTAMP('2024-12-28 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Auditorium')
    INTO EventPart (id, what, "when", "where") VALUES (15, 'Robotics Demo', TO_TIMESTAMP('2024-12-28 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lab Room 1')
    INTO EventPart (id, what, "when", "where") VALUES (16, 'Physics Experiments', TO_TIMESTAMP('2024-12-28 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Experiment Zone')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (14, 6)
    INTO Timetable (EventPart_id, Event_id) VALUES (15, 6)
    INTO Timetable (EventPart_id, Event_id) VALUES (16, 6)
SELECT * FROM dual;

-- Insert EventParts for Event 7: Film Festival
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (17, 'Opening Film Screening', TO_TIMESTAMP('2024-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Theater 1')
    INTO EventPart (id, what, "when", "where") VALUES (18, 'Director Q&A', TO_TIMESTAMP('2024-12-28 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Theater 1')
    INTO EventPart (id, what, "when", "where") VALUES (19, 'Awards Ceremony', TO_TIMESTAMP('2024-12-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Hall')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (17, 7)
    INTO Timetable (EventPart_id, Event_id) VALUES (18, 7)
    INTO Timetable (EventPart_id, Event_id) VALUES (19, 7)
SELECT * FROM dual;

-- Insert EventParts for Event 8: Charity Gala
INSERT ALL
    INTO EventPart (id, what, "when", "where") VALUES (20, 'Dinner Reception', TO_TIMESTAMP('2024-12-28 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Banquet Hall')
    INTO EventPart (id, what, "when", "where") VALUES (21, 'Fundraising Auction', TO_TIMESTAMP('2024-12-28 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Ballroom')
    INTO EventPart (id, what, "when", "where") VALUES (22, 'Closing Speech', TO_TIMESTAMP('2024-12-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Ballroom')
SELECT * FROM dual;
INSERT ALL
    INTO Timetable (EventPart_id, Event_id) VALUES (20, 8)
    INTO Timetable (EventPart_id, Event_id) VALUES (21, 8)
    INTO Timetable (EventPart_id, Event_id) VALUES (22, 8)
SELECT * FROM dual;
