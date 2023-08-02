# Project flow

_This document under construction._


## Sequence diagram

```mermaid

sequenceDiagram


    actor person as Team Member
    participant term as Terminal
    participant qaskx as qaskx-cli
    participant git as Github

    person ->>+ term: start

    Note over term, git: Allocate repo name for server

    term ->>+ qaskx: 
    Note over git: qaskx-cli rediops git (*) cmd
    qaskx ->>+ git: 
    git -->>- qaskx: New git created
    qaskx -->>- term: Success

    term ->>+ git: git clone
    git -->>- term: 

    term ->>+ qaskx: qaskx-cli rediops configure cmd
    qaskx -->>- term: 

    term ->>+ git: git commit & push
    git -->>- term: 

    opt Only applicable for new clients (web, mobile)
    Note over term, git: Allocate repo name for client

    term ->>+ qaskx: 
    Note over git: qaskx-cli rediops git (*) cmd
    qaskx ->>+ git: 
    git -->>- qaskx: New git created
    qaskx -->>- term: Success

    term ->>+ git: git clone
    git -->>- term: 

    term ->>+ qaskx: qaskx-cli rediops configure cmd
    qaskx -->>- term: 

    term ->>+ git: git commit & push
    git -->>- term: 
    end

    term -->>- person: 

```

The git repositories are now primed and ready for API specification.

The tasks in the sequence diagram is provisioning the required repositories.  
The client repo may already exist for other functionality in which cas it is not
created, but will be used in the [developer client start](developer_client_start.md)

# End Status of flow

At the end of this flow the scope of the API delivery and the service domain
will be understood.

The project information is next used in the 
[analysis start](analysis_start.md) flow.

# Reading Notes

A well defined service domain that is understood and agreed by all parties
will reduce rework effort, though with automation tools the manual effort
can be better managed.

A service domain can only return information or action requests that are 
within its ability to fetch or remit to complete.
