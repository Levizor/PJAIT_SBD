-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-12-28 16:43:54.349

-- foreign keys
ALTER TABLE AgentAgentTeam
    DROP CONSTRAINT AgentAgentTeam_Agent;

ALTER TABLE AgentAgentTeam
    DROP CONSTRAINT AgentAgentTeam_AgentTeam;

ALTER TABLE AgentTeam
    DROP CONSTRAINT AgentTeam_AgentEntity;

ALTER TABLE Agent
    DROP CONSTRAINT Agent_AgentEntity;

ALTER TABLE Agent
    DROP CONSTRAINT Agent_Person;

ALTER TABLE Client
    DROP CONSTRAINT Client_Address;

ALTER TABLE Client
    DROP CONSTRAINT Client_Entity;

ALTER TABLE Contact
    DROP CONSTRAINT Contact_PrefferedContactType;

ALTER TABLE Contract
    DROP CONSTRAINT Contract_Entity;

ALTER TABLE CorporativeEntity
    DROP CONSTRAINT CorporativeEntity_Entity;

ALTER TABLE CorporativeEntity
    DROP CONSTRAINT Entity_Address;

ALTER TABLE Entity
    DROP CONSTRAINT Entity_Contact;

ALTER TABLE EventClient
    DROP CONSTRAINT EventClient_Client;

ALTER TABLE EventClient
    DROP CONSTRAINT EventClient_Event;

ALTER TABLE EventContract
    DROP CONSTRAINT EventContract_Contract;

ALTER TABLE EventContract
    DROP CONSTRAINT EventContract_Event;

ALTER TABLE EventSupplier
    DROP CONSTRAINT EventSupplier_Event;

ALTER TABLE EventSupplier
    DROP CONSTRAINT EventSupplier_Supplier;

ALTER TABLE Event
    DROP CONSTRAINT Event_Address;

ALTER TABLE Event
    DROP CONSTRAINT Event_AgentEntity;

ALTER TABLE Event
    DROP CONSTRAINT Event_EventType;

ALTER TABLE Person
    DROP CONSTRAINT Person_Entity;

ALTER TABLE Supplier
    DROP CONSTRAINT Supplier_CorporativeEntity;

ALTER TABLE Supplier
    DROP CONSTRAINT Supplier_SupplierType;

ALTER TABLE Timetable
    DROP CONSTRAINT Timetable_Event;

ALTER TABLE Timetable
    DROP CONSTRAINT Timetable_EventPart;

-- tables
DROP TABLE Address;

DROP TABLE Agent;

DROP TABLE AgentAgentTeam;

DROP TABLE AgentEntity;

DROP TABLE AgentTeam;

DROP TABLE Client;

DROP TABLE Contact;

DROP TABLE Contract;

DROP TABLE CorporativeEntity;

DROP TABLE Entity;

DROP TABLE Event;

DROP TABLE EventClient;

DROP TABLE EventContract;

DROP TABLE EventPart;

DROP TABLE EventSupplier;

DROP TABLE EventType;

DROP TABLE Person;

DROP TABLE PrefferedContactType;

DROP TABLE Supplier;

DROP TABLE SupplierType;

DROP TABLE Timetable;

-- End of file.

