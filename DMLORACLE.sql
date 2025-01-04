-- Insert data into Address table
INSERT INTO Address (id, city, street, building, add_info) VALUES
(1, 'Poznan', '5th Ave', '101', 'Near Central Park'),
(2, 'Gdansk', 'Sunset Blvd', '202', 'Close to Hollywood'),
(3, 'Warsaw', 'Michigan Ave', '303', 'Next to Millennium Park'),
(4, 'Gdansk', 'Ocean Drive', '404', 'Near South Beach'),
(5, 'Krakow', 'Market St', '505', 'Near Ferry Building'),
(6, 'Lublin', 'Congress Ave', '606', 'Downtown Austin'),
(7, 'Gdynia', 'Pine St', '707', 'Near Pike Place Market'),
(8, 'Warsaw', 'Newbury St', '808', 'In the Back Bay area'),
(9, 'Warsaw', 'Staszica', '55', null),
(10, 'Lublin', 'Newbury St', '809', 'Near the ABC river'),
(11, 'Gdansk', 'Wrzeszcz', '809', 'Next to the Wrzeszcz station');

-- Insert data into Entity table
INSERT INTO Entity (id, Contact_id, registration_date) VALUES
(1, 1, TO_DATE('2022-08-25', 'YYYY-MM-DD')),
(2, 2, TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(3, 3, TO_DATE('2021-06-10', 'YYYY-MM-DD')),
(4, 4, TO_DATE('2020-02-20', 'YYYY-MM-DD')),
(5, 5, TO_DATE('2019-12-30', 'YYYY-MM-DD')),
(6, 6, TO_DATE('2022-03-01', 'YYYY-MM-DD')),
(7, 7, TO_DATE('2023-06-15', 'YYYY-MM-DD')),
(8, 8, TO_DATE('2024-07-04', 'YYYY-MM-DD')),
(9, 9, TO_DATE('2020-08-01', 'YYYY-MM-DD')),
(10, 10, TO_DATE('2021-04-12', 'YYYY-MM-DD')),
(11, 11, TO_DATE('2019-08-15', 'YYYY-MM-DD'));

-- Insert data into Person table
INSERT INTO Person (id, first_name, last_name, date_of_birth) VALUES
(1, 'John', 'Doe', TO_DATE('1985-03-25', 'YYYY-MM-DD')),
(2, 'Jane', 'Smith', TO_DATE('1990-07-15', 'YYYY-MM-DD')),
(3, 'Michael', 'Johnson', TO_DATE('1982-11-30', 'YYYY-MM-DD')),
(4, 'Emily', 'Davis', TO_DATE('1995-05-21', 'YYYY-MM-DD')),
(5, 'David', 'Martinez', TO_DATE('1980-08-10', 'YYYY-MM-DD')),
(6, 'Sarah', 'Taylor', TO_DATE('1992-12-05', 'YYYY-MM-DD')),
(7, 'James', 'Brown', TO_DATE('1987-01-13', 'YYYY-MM-DD')),
(8, 'Mary', 'Wilson', TO_DATE('1998-10-30', 'YYYY-MM-DD'));

-- Insert data into AgentEntity table
INSERT INTO AgentEntity (id, cabinet_number) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108);

-- Insert data into Agent table
INSERT INTO Agent (id, AgentEntity_id, SAL, COM) VALUES
(1, 1, 50000, 3000),
(2, 2, 55000, 4000),
(3, 3, 60000, 3500),
(4, 4, 45000, 2500),
(5, 5, 70000, 5000),
(6, 6, 65000, 4500),
(7, 7, 62000, 4200),
(8, 8, 48000, 2800);

-- Insert data into AgentTeam table
INSERT INTO AgentTeam (id, name, creation_date) VALUES
(1, 'Team Alpha', TO_DATE('2020-01-01', 'YYYY-MM-DD')),
(2, 'Team Beta', TO_DATE('2021-06-01', 'YYYY-MM-DD')),
(3, 'Team Gamma', TO_DATE('2022-03-15', 'YYYY-MM-DD')),
(4, 'Team Delta', TO_DATE('2019-10-10', 'YYYY-MM-DD')),
(5, 'Team Epsilon', TO_DATE('2023-07-20', 'YYYY-MM-DD')),
(6, 'Team Zeta', TO_DATE('2021-12-11', 'YYYY-MM-DD')),
(7, 'Team Theta', TO_DATE('2020-05-25', 'YYYY-MM-DD')),
(8, 'Team Iota', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

-- Insert data into AgentAgentTeam table
INSERT INTO AgentAgentTeam (agent_id, team_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7);

-- Insert data into Entity table
INSERT INTO Entity (id, Contact_id, registration_date) VALUES
(1, 1, TO_DATE('2022-08-25', 'YYYY-MM-DD')),
(2, 2, TO_DATE('2023-01-15', 'YYYY-MM-DD')),
(3, 3, TO_DATE('2021-06-10', 'YYYY-MM-DD')),
(4, 4, TO_DATE('2020-02-20', 'YYYY-MM-DD')),
(5, 5, TO_DATE('2019-12-30', 'YYYY-MM-DD')),
(6, 6, TO_DATE('2022-03-01', 'YYYY-MM-DD')),
(7, 7, TO_DATE('2023-06-15', 'YYYY-MM-DD')),
(8, 8, TO_DATE('2024-07-04', 'YYYY-MM-DD')),
(9, 9, TO_DATE('2020-08-01', 'YYYY-MM-DD')),
(10, 10, TO_DATE('2021-04-12', 'YYYY-MM-DD'));

INSERT INTO CorporativeEntity (id, name, tax_id, Address_id) VALUES
(9, 'TIX Corporation', 'abcd04564', 9),
(10, 'Apple', 'tti4578aa', 10),
(11, 'Typography', 'xxoa44489', 11);

-- Insert data into Client table
INSERT INTO Client (Entity_id, billing_address) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Insert data into Contact table
INSERT INTO Contact (id, phone_number, email, PrefferedContactType_id) VALUES
(1, '5551234567', 'john.doe@example.com', 1),
(2, '5552345678', 'jane.smith@example.com', 2),
(3, '5553456789', 'michael.johnson@example.com', 1),
(4, '5554567890', 'emily.davis@example.com', 3),
(5, '5555678901', 'david.martinez@example.com', 2),
(6, '5556789012', 'sarah.taylor@example.com', 3),
(7, '5557890123', 'james.brown@example.com', 1),
(8, '5558901234', 'mary.wilson@example.com', 2),
(9, '113445789', 'tix@tix.com', 3),
(10, '555666778', 'apple@apple.com', 1),
(11, '789794568', 'typo@gmail.com', 2);
-- Insert data into PrefferedContactType table
INSERT INTO PrefferedContactType (id, type) VALUES
(1, 'Phone'),
(2, 'Email'),
(3, 'SMS');

-- Insert data into Contract table
INSERT INTO Contract (id, Entity_id, document, short_description) VALUES
(1, 1, 'Contract1.pdf', 'Service agreement for client A'),
(2, 2, 'Contract2.pdf', 'Service agreement for client B'),
(3, 3, 'Contract3.pdf', 'Service agreement for client C'),
(4, 4, 'Contract4.pdf', 'Service agreement for client D'),
(5, 5, 'Contract5.pdf', 'Service agreement for client E'),
(6, 6, 'Contract6.pdf', 'Service agreement for client F'),
(7, 7, 'Contract7.pdf', 'Service agreement for client G'),
(8, 8, 'Contract8.pdf', 'Service agreement for client H');

-- Insert data into EventType table
INSERT INTO EventType (id, name) VALUES
(1, 'Conference'),
(2, 'Workshop'),
(3, 'Seminar'),
(4, 'Webinar'),
(5, 'Trade Show'),
(6, 'Networking Event'),
(7, 'Product Launch'),
(8, 'Training');

-- Insert data into Event table
INSERT INTO Event (id, name, description, Address_id, AgentEntity_id, EventType_id) VALUES
(1, 'Tech Conference', 'A conference about the latest in technology.', 1, 1, 1),
(2, 'Marketing Workshop', 'A workshop focused on digital marketing strategies.', 2, 2, 2),
(3, 'Leadership Seminar', 'A seminar on leadership and team management.', 3, 3, 3),
(4, 'Online Marketing Webinar', 'A webinar on effective online marketing techniques.', 4, 4, 4),
(5, 'Tech Trade Show', 'A trade show showcasing tech companies.', 5, 5, 5),
(6, 'Business Networking', 'A networking event for entrepreneurs and investors.', 6, 6, 6),
(7, 'Product Launch Event', 'Launch event for a new software product.', 7, 7, 7),
(8, 'Corporate Training', 'A training session for corporate employees.', 8, 8, 8);

-- Insert data into EventClient table
INSERT INTO EventClient (Client_Entity_id, Event_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Insert data into EventContract table
INSERT INTO EventContract (Contract_id, Event_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Insert data into SupplierType table
INSERT INTO SupplierType (id, name) VALUES
(1, 'Catering'),
(2, 'Technology'),
(3, 'Logistics'),
(4, 'Entertainment'),
(5, 'Security'),
(6, 'Decorations'),
(7, 'Printing'),
(8, 'AV Equipment');

-- Insert data into Supplier table
INSERT INTO Supplier (id, SupplierType_id) VALUES
(11, 7),

-- Insert data into EventSupplier table
INSERT INTO EventSupplier (Event_id, Supplier_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- Insert EventParts for Event 1: Tech Industry Conference
INSERT INTO EventPart (id, what, "when", "where") VALUES
(1, 'Speech by AI Specialist', TO_TIMESTAMP('2024-12-28 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Conference Room'),
(2, 'Cybersecurity Workshop', TO_TIMESTAMP('2024-12-28 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Workshop Room A');
INSERT INTO Timetable (EventPart_id, Event_id) VALUES
(1, 1),  -- EventPart 1 for Event 1 (Tech Industry Conference)
(2, 1);  -- EventPart 2 for Event 1 (Tech Industry Conference)

-- Insert EventParts for Event 2: Cooking Competition
INSERT INTO EventPart (id, what, "when", "where") VALUES
(3, 'Cooking Competition', TO_TIMESTAMP('2024-12-28 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Kitchen Arena'),
(4, 'Award Ceremony', TO_TIMESTAMP('2024-12-28 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Stage Area');
INSERT INTO Timetable (EventPart_id, Event_id) VALUES
(3, 2),  -- EventPart 1 for Event 2 (Cooking Competition)
(4, 2);  -- EventPart 2 for Event 2 (Cooking Competition)

INSERT INTO EventPart (id, what, "when", "where") VALUES
(5, 'Opening Concert', TO_TIMESTAMP('2024-12-28 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Stage'),
(6, 'Rock Band Performance', TO_TIMESTAMP('2024-12-28 20:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Main Stage'),
(7, 'DJ Set', TO_TIMESTAMP('2024-12-28 22:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dance Floor');
INSERT INTO Timetable (EventPart_id, Event_id) VALUES
(5, 3),  -- EventPart 1 for Event 3 (Music Festival)
(6, 3),  -- EventPart 2 for Event 3 (Music Festival)
(7, 3);  -- EventPart 3 for Event 3 (Music Festival)

INSERT INTO EventPart (id, what, "when", "where") VALUES
(8, 'Networking Breakfast', TO_TIMESTAMP('2024-12-28 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Lobby Area'),
(9, 'Industry Leaders Panel', TO_TIMESTAMP('2024-12-28 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Conference Room B'),
(10, 'Lunch Break', TO_TIMESTAMP('2024-12-28 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Dining Area');
INSERT INTO Timetable (EventPart_id, Event_id) VALUES
(8, 4),  -- EventPart 1 for Event 4 (Business Networking)
(9, 4),  -- EventPart 2 for Event 4 (Business Networking)
(10, 4); -- EventPart 3 for Event 4 (Business Networking)
