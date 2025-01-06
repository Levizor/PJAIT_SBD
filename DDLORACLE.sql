-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-12-28 16:43:54.349

-- tables
-- Table: Address
CREATE TABLE Address (
    id integer  NOT NULL,
    city nvarchar2(20)  NOT NULL,
    street nvarchar2(30)  NOT NULL,
    building nvarchar2(10)  NOT NULL,
    add_info nvarchar2(200)  NOT NULL,
    CONSTRAINT Address_pk PRIMARY KEY (id)
) ;

-- Table: Agent
CREATE TABLE Agent (
    id integer  NOT NULL,
    AgentEntity_id integer  NOT NULL,
    SAL number(10,2)  NOT NULL,
    COM number(6,2)  NOT NULL,
    CONSTRAINT Agent_pk PRIMARY KEY (id)
) ;

-- Table: AgentAgentTeam
CREATE TABLE AgentAgentTeam (
    agent_id integer  NOT NULL,
    team_id integer  NOT NULL,
    CONSTRAINT AgentAgentTeam_pk PRIMARY KEY (team_id,agent_id)
) ;

-- Table: AgentEntity
CREATE TABLE AgentEntity (
    id integer  NOT NULL,
    cabinet_number integer  NOT NULL,
    CONSTRAINT AgentEntity_pk PRIMARY KEY (id)
) ;

-- Table: AgentTeam
CREATE TABLE AgentTeam (
    id integer  NOT NULL,
    name nvarchar2(200)  NOT NULL,
    creation_date date  NOT NULL,
    CONSTRAINT AgentTeam_pk PRIMARY KEY (id)
) ;

-- Table: Client
CREATE TABLE Client (
    Entity_id integer  NOT NULL,
    billing_address integer  NOT NULL,
    CONSTRAINT Client_pk PRIMARY KEY (Entity_id)
) ;

-- Table: Contact
CREATE TABLE Contact (
    id integer  NOT NULL,
    phone_number nvarchar2(10)  NOT NULL,
    email nvarchar2(50)  NOT NULL,
    PrefferedContactType_id integer  NULL,
    CONSTRAINT Contact_pk PRIMARY KEY (id)
) ;

-- Table: Contract
CREATE TABLE Contract (
    id integer  NOT NULL,
    Entity_id integer  NOT NULL,
    document nvarchar2(1000)  NULL,
    short_description nvarchar2(100)  NOT NULL,
    CONSTRAINT Contract_pk PRIMARY KEY (id)
) ;

-- Table: CorporativeEntity
CREATE TABLE CorporativeEntity (
    id integer  NOT NULL,
    name nvarchar2(100)  NOT NULL,
    tax_id nvarchar2(20)  NOT NULL,
    Address_id integer  NOT NULL,
    CONSTRAINT CorporativeEntity_pk PRIMARY KEY (id)
) ;

-- Table: Entity
CREATE TABLE Entity (
    id integer  NOT NULL,
    Contact_id integer  NOT NULL,
    registration_date date  NOT NULL,
    CONSTRAINT Entity_pk PRIMARY KEY (id)
) ;

-- Table: Event
CREATE TABLE Event (
    id integer  NOT NULL,
    name nvarchar2(50)  NOT NULL,
    description nvarchar2(500)  NOT NULL,
    Address_id integer  NOT NULL,
    AgentEntity_id integer  NOT NULL,
    EventType_id integer  NOT NULL,
    CONSTRAINT Event_pk PRIMARY KEY (id)
) ;

-- Table: EventClient
CREATE TABLE EventClient (
    Client_Entity_id integer  NOT NULL,
    Event_id integer  NOT NULL,
    CONSTRAINT EventClient_pk PRIMARY KEY (Client_Entity_id,Event_id)
) ;

-- Table: EventContract
CREATE TABLE EventContract (
    Contract_id integer  NOT NULL,
    Event_id integer  NOT NULL,
    CONSTRAINT EventContract_pk PRIMARY KEY (Contract_id,Event_id)
) ;

-- Table: EventPart
CREATE TABLE EventPart (
    id integer  NOT NULL,
    what nvarchar2(100)  NOT NULL,
    "when" timestamp  NOT NULL,
    "where" nvarchar2(100)  NOT NULL,
    CONSTRAINT EventPart_pk PRIMARY KEY (id)
) ;

-- Table: EventSupplier
CREATE TABLE EventSupplier (
    Event_id integer  NOT NULL,
    Supplier_id integer  NOT NULL,
    CONSTRAINT EventSupplier_pk PRIMARY KEY (Event_id,Supplier_id)
) ;

-- Table: EventType
CREATE TABLE EventType (
    id integer  NOT NULL,
    name nvarchar2(50)  NOT NULL,
    CONSTRAINT EventType_pk PRIMARY KEY (id)
) ;

-- Table: Person
CREATE TABLE Person (
    id integer  NOT NULL,
    first_name nvarchar2(30)  NOT NULL,
    last_name nvarchar2(30)  NOT NULL,
    date_of_birth date  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (id)
) ;

-- Table: PrefferedContactType
CREATE TABLE PrefferedContactType (
    id integer  NOT NULL,
    type nvarchar2(50)  NOT NULL,
    CONSTRAINT PrefferedContactType_pk PRIMARY KEY (id)
) ;

-- Table: Supplier
CREATE TABLE Supplier (
    id integer  NOT NULL,
    SupplierType_id integer  NOT NULL,
    CONSTRAINT Supplier_pk PRIMARY KEY (id)
) ;

-- Table: SupplierType
CREATE TABLE SupplierType (
    id integer  NOT NULL,
    name nvarchar2(50)  NOT NULL,
    CONSTRAINT SupplierType_pk PRIMARY KEY (id)
) ;

-- Table: Timetable
CREATE TABLE Timetable (
    EventPart_id integer  NOT NULL,
    Event_id integer  NOT NULL,
    CONSTRAINT Timetable_pk PRIMARY KEY (EventPart_id,Event_id)
) ;

-- foreign keys
-- Reference: AgentAgentTeam_Agent (table: AgentAgentTeam)
ALTER TABLE AgentAgentTeam ADD CONSTRAINT AgentAgentTeam_Agent
    FOREIGN KEY (agent_id)
    REFERENCES Agent (id);

-- Reference: AgentAgentTeam_AgentTeam (table: AgentAgentTeam)
ALTER TABLE AgentAgentTeam ADD CONSTRAINT AgentAgentTeam_AgentTeam
    FOREIGN KEY (team_id)
    REFERENCES AgentTeam (id);

-- Reference: AgentTeam_AgentEntity (table: AgentTeam)
ALTER TABLE AgentTeam ADD CONSTRAINT AgentTeam_AgentEntity
    FOREIGN KEY (id)
    REFERENCES AgentEntity (id);

-- Reference: Agent_AgentEntity (table: Agent)
ALTER TABLE Agent ADD CONSTRAINT Agent_AgentEntity
    FOREIGN KEY (AgentEntity_id)
    REFERENCES AgentEntity (id);

-- Reference: Agent_Person (table: Agent)
ALTER TABLE Agent ADD CONSTRAINT Agent_Person
    FOREIGN KEY (id)
    REFERENCES Person (id);

-- Reference: Client_Address (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_Address
    FOREIGN KEY (billing_address)
    REFERENCES Address (id);

-- Reference: Client_Entity (table: Client)
ALTER TABLE Client ADD CONSTRAINT Client_Entity
    FOREIGN KEY (Entity_id)
    REFERENCES Entity (id);

-- Reference: Contact_PrefferedContactType (table: Contact)
ALTER TABLE Contact ADD CONSTRAINT Contact_PrefferedContactType
    FOREIGN KEY (PrefferedContactType_id)
    REFERENCES PrefferedContactType (id);

-- Reference: Contract_Entity (table: Contract)
ALTER TABLE Contract ADD CONSTRAINT Contract_Entity
    FOREIGN KEY (Entity_id)
    REFERENCES Entity (id);

-- Reference: CorporativeEntity_Entity (table: CorporativeEntity)
ALTER TABLE CorporativeEntity ADD CONSTRAINT CorporativeEntity_Entity
    FOREIGN KEY (id)
    REFERENCES Entity (id);

-- Reference: Entity_Address (table: CorporativeEntity)
ALTER TABLE CorporativeEntity ADD CONSTRAINT Entity_Address
    FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Entity_Contact (table: Entity)
ALTER TABLE Entity ADD CONSTRAINT Entity_Contact
    FOREIGN KEY (Contact_id)
    REFERENCES Contact (id);

-- Reference: EventClient_Client (table: EventClient)
ALTER TABLE EventClient ADD CONSTRAINT EventClient_Client
    FOREIGN KEY (Client_Entity_id)
    REFERENCES Client (Entity_id);

-- Reference: EventClient_Event (table: EventClient)
ALTER TABLE EventClient ADD CONSTRAINT EventClient_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: EventContract_Contract (table: EventContract)
ALTER TABLE EventContract ADD CONSTRAINT EventContract_Contract
    FOREIGN KEY (Contract_id)
    REFERENCES Contract (id);

-- Reference: EventContract_Event (table: EventContract)
ALTER TABLE EventContract ADD CONSTRAINT EventContract_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: EventSupplier_Event (table: EventSupplier)
ALTER TABLE EventSupplier ADD CONSTRAINT EventSupplier_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: EventSupplier_Supplier (table: EventSupplier)
ALTER TABLE EventSupplier ADD CONSTRAINT EventSupplier_Supplier
    FOREIGN KEY (Supplier_id)
    REFERENCES Supplier (id);

-- Reference: Event_Address (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_Address
    FOREIGN KEY (Address_id)
    REFERENCES Address (id);

-- Reference: Event_AgentEntity (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_AgentEntity
    FOREIGN KEY (AgentEntity_id)
    REFERENCES AgentEntity (id);

-- Reference: Event_EventType (table: Event)
ALTER TABLE Event ADD CONSTRAINT Event_EventType
    FOREIGN KEY (EventType_id)
    REFERENCES EventType (id);

-- Reference: Person_Entity (table: Person)
ALTER TABLE Person ADD CONSTRAINT Person_Entity
    FOREIGN KEY (id)
    REFERENCES Entity (id);

-- Reference: Supplier_CorporativeEntity (table: Supplier)
ALTER TABLE Supplier ADD CONSTRAINT Supplier_CorporativeEntity
    FOREIGN KEY (id)
    REFERENCES CorporativeEntity (id);

-- Reference: Supplier_SupplierType (table: Supplier)
ALTER TABLE Supplier ADD CONSTRAINT Supplier_SupplierType
    FOREIGN KEY (SupplierType_id)
    REFERENCES SupplierType (id);

-- Reference: Timetable_Event (table: Timetable)
ALTER TABLE Timetable ADD CONSTRAINT Timetable_Event
    FOREIGN KEY (Event_id)
    REFERENCES Event (id);

-- Reference: Timetable_EventPart (table: Timetable)
ALTER TABLE Timetable ADD CONSTRAINT Timetable_EventPart
    FOREIGN KEY (EventPart_id)
    REFERENCES EventPart (id);

-- End of file.

