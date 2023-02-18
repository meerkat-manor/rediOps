# Typical Microservice


## Service sequence diagrams


### Health check

The health sequence diagram for a typical microservice might be:

```mermaid

sequenceDiagram

    Sysops ->> Gateway: Regular checks 
    Activate Gateway
    Gateway ->> Gateway: 
    Note right of Gateway: Check source IP for eligibility  
    Gateway ->> Microservice: Service to health check

    Activate Microservice
    Microservice ->> Health: 

    Activate Health
    Health ->> Health: API enabled

    Health ->> Health: Runtime and logic check

    Health ->> Database: Check live and records
    Activate Database
    Database -->> Health: Ok
    Deactivate Database

    Health -->> Microservice: 
    deactivate Health

    Microservice -->> Gateway: Health response
    deactivate Microservice

    Gateway -->> Sysops: 
    deactivate Gateway

```


### Resource listing

The resource listing sequence diagram for a typical microservice might be:

```mermaid

sequenceDiagram

    Web ->> Gateway: On demand 
    Activate Gateway
    Gateway ->> Gateway: 
    Note right of Gateway: Authentication  
    Gateway ->> Gateway: 
    Note right of Gateway: Rate limiting  
    Gateway ->> Microservice: Resource listing

    Activate Microservice

    Microservice ->> Microservice: Validate resource

    Microservice ->> Microservice: Resource authorisation

    Microservice ->> Database: Fetch records
    Activate Database
    Database -->> Microservice: Ok
    Deactivate Database

    Microservice -->> Gateway: Listing response
    deactivate Microservice

    Gateway -->> Web:  
    deactivate Gateway

```