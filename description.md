# Event Agency Database

## Database Requirements

Database is made for an Event Agency which purpose is to organise and manage corporative and private events for their clients.

- It must contain all the information about clients, such as names, surnames, phone number, email, preferred type of contact. Client may be both individuals and corporative entities. For corporative entities we must additionaly know name of the company and their address.

- Suppliers or services that we utilize to organise events, e.g. to rent some place or to order some typography, are stored containing their names, addresses, type of services they provide, contact information.

- We have contracts with both suppliers and clients that we need to link to respective records in the history of events organised by our agency, which aggregates data of clients (there may be multiple customers), events information (address, timetable, description, price, etc), suppliers (also multiple) affiliated with event organisation. Events may have diferrent subparts at diferrent time and date. There are also diferrent type of events (PR, private, corporate, special). 

- Finally we have agents and agent teams. Events may be organised by either a team or a single agent. Besides obvious person information database should contain emloyees salary, comission, count of events agent participated in organising.

## Entities and connections
There is a base class "Entity" for the legal entities from which all the other (Clinet, Person, CorporativeEntity) inherit. 
Having this structure we can satisfy scenarios where Client can be both individual(Person) or corporative(CorporativeEntity).
Base entity is directly connected to the Contact, so that each entity regardless of their type can have contact information.
Agents connect with teams and AgentEntity. AgentEntity consist of both Agents and their teams, and can be connected to Event.
Clients connect to Event through EventClient.
Suppliers inherit from CorporativeEntity and store types in separate table SupplierType.
Event stores events information and connects all the necessary information about event location, type, timetable, suppliers.

## Sample functionalities
1. Retrieve all the agents that are not busy with event on a specific date.
2. Show suppliers and count of collaborations with them.
3. Present all the events made for the company wich ordered the highest price event.
4. Find top agent/agent_teams ordered by the count of events organised.
5. List all addresses of the events where specified rental agency participated in organising.

