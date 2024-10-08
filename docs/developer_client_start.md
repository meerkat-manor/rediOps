# Front end client developer flow (start)

This is the initialisation of the front end 
client code.  Coding the server is covered in document
[developers server start](developers_server_start.md)

The [analysis start](analysis_start.md) is a pre-requisite for
this flow.

The assumptions for this documents are:

* the Git repository has been created
* a new API is required to be exposed
* an OpenAPI definition exists in Git
* no API coding has commenced
* Visual Studio Code has been installed
* Developer has access to the API editor viewer for the OpenAPI specification

## Sequence Diagram

### Automation

The sequence of automation activity using **devops** file and **qaskx-cli** is 
as follows.

The Qaskx command line tool needs to be installed on the developer machine

```mermaid
---
title: Client development task flow
---
sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant term as Terminal
    participant qaskx as qaskx-cli
    participant cmdb as CMDB
    participant git as Github
    link git: GitHub @ https://github.com/meerkat-manor/devops
    participant oas3f as OpenAPI file
    participant devops as devops file
    participant apip as API portal

    dev ->>+ vsc: start IDE

    Note over vsc, term: Clone existing git for project
    vsc ->>+ git : 
    git -->>- vsc : Cloned, project opened

    Note over git, devops: The OpenAPI and devops files are stored in Git

    alt If no OpenAPI dependency linked
    vsc -) devops: Update OpenAPI dependency entry
    end

    vsc ->>+ term: start
    term ->>+ qaskx: New CMDB CI
    qaskx ->>+ devops: Read 
    devops -->>- qaskx: Contents
    loop Read called dependencies
    qaskx ->>+ oas3f: Read dependency
    oas3f -->>- qaskx: Contents
    end
    Note over cmdb, git: qaskx-cli rediops cmdb cmd
    qaskx ->>+ cmdb: 
    cmdb -->>- qaskx: New CMDB CI value
    qaskx -) devops: Update CMDB CI entry
    qaskx -->>- term: Success

    term ->>+ qaskx: Generate code
    Note over qaskx, cmdb: qaskx-cli gen client cmd
    qaskx ->>+ devops: Read dependency list
    devops -->>- qaskx: Contents
    loop Read called dependencies
    qaskx ->>+ oas3f: Read dependency
    oas3f -->>- qaskx: Contents
    qaskx -) qaskx: Auto generate client code
    end
    qaskx -) qaskx: Auto generate sequence diagram
    qaskx -) qaskx: Auto generate feature flags
    qaskx -) devops: Auto update entries, including build, test
    qaskx -->>- term: Success

    alt Register using API dependencies if not already done

    term ->>+ qaskx: Register API dependencies
    Note over cmdb, git: qaskx-cli rediops register cmd
    qaskx ->>+ devops: Read 
    devops -->>- qaskx: Contents
    loop Read called dependencies
    qaskx ->>+ oas3f: Read 
    oas3f -->>- qaskx: Contents
    qaskx ->>+ apip: 
    apip -->>- qaskx: Registered as consumer
    end
    qaskx -) devops: Auto update API entry
    qaskx -->>- term: Success

    end

    term -->- vsc: close

    rect lightgrey
    Note over vsc, qaskx: Developer codes to use the OpenAPI definition, with base code in place
    vsc -->> vsc: Code update
    vsc -->> vsc: Local build
    vsc -->> vsc: Local test
    end 

    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: close

```

### Manual

The equivalent sequence of manual activity, non qaskx actions is as follows.
The **devops** file is still used.  Without **devops** file you will 
follow whatever your existing process is and recorded the necessary 
details in various documents

The OpenAPI tool needs to be installed on the developer machine.

```mermaid
---
title: Client development task flow
---
sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant cmdb as CMDB
    link vsc: Visual Studio @ https://code.visualstudio.com/
    participant term as Terminal
    participant git as Github
    link git: GitHub @ https://github.com/meerkat-manor/devops
    participant oas3f as OpenAPI file
    participant devops as devops file
    participant oas3 as OpenAPI tool
    participant apip as API portal


    Note over cmdb, vsc: Create new CMDB CI entry for Client  
    dev ->>+ cmdb: Access UI
    cmdb -->> cmdb: Create CMDB CI entry
    cmdb -->>- dev: Close, noting CI value

    Note over git, devops: The devops file is stored in Git

    dev ->>+ vsc: start IDE

    Note over cmdb, vsc: Clone existing git for project
    vsc ->>+ git : 
    git -->>- vsc : Cloned, project opened

    vsc -) devops: Update CMDB CI entry

    vsc ->>+ term: start
    Note over git, oas3: Set generation parameters
    term ->>+ oas3: Generate code cmd
    oas3 ->>+ oas3f: Read 
    oas3f -->>- oas3: Contents
    oas3 -->>- term: Success
    term -->- vsc: close

    vsc -) vsc: Update client code with defaults
    vsc -) vsc: Manually write sequence diagrams
    vsc -) vsc: Manually write Gateway infra
    vsc -) vsc: Manually write feature flags

    alt Register using API dependencies if not already done

    dev ->>+ apip: Register as consuming APIs
    apip -->>- dev: Registered

    end

    vsc -) devops: Manually update entries

    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: Done


```

# End Status of flow

At the end of this flow the basic code stubs exist and have been committed
to Github.  The code can execute and will return not implemented
response results if the client is a non UI, headless consumer of the API.

For clients that will have a UI, the code will not work as no UI coding is
expected to have been done.


# Reading Notes

For automation, some activities can be performed by GitActions calling
qaskx-cli.

The Visual Studio Code, CMDB and Github components can be substituted for 
other software products such IntelliJ and Bitbucket.

