# Back end server developer flow (start)

This is the initialisation of the back end 
code.  Coding the client is covered in document
[developers client start](developers_client_start.md)

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

The sequence of automation activity using **rediops** and **qaskx-cli** is 
as follows.

The Qaskx command line tool needs to be installed on the developer machine

```mermaid

sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant term as Terminal
    participant qaskx as qaskx-cli
    participant cmdb as CMDB
    participant git as Github
    link git: GitHub @ https://github.com/meerkat-manor/rediOps
    participant oas3f as OpenAPI file
    participant rediops as rediops file
    participant apip as API portal

    dev ->>+ vsc: start IDE

    Note over vsc, term: Clone existing git for project
    vsc ->>+ git : 
    git -->>- vsc : Cloned, project opened

    Note over git, rediops: The OpenAPI and rediops files are stored in Git

    vsc ->>+ term: start
    term ->>+ qaskx: New CI
    qaskx ->>+ rediops: Read 
    rediops -->>- qaskx: Contents
    qaskx ->>+ oas3f: Read 
    oas3f -->>- qaskx: Contents
    Note over cmdb, git: qaskx rediops ci cmd
    qaskx ->>+ cmdb: 
    cmdb -->>- qaskx: New CI value
    qaskx -) rediops: Update CI entry
    qaskx -->>- term: Success

    term ->>+ qaskx: Generate code
    Note over qaskx, cmdb: qaskx gen server cmd
    qaskx ->>+ rediops: Read 
    rediops -->>- qaskx: Contents
    qaskx ->>+ oas3f: Read 
    oas3f -->>- qaskx: Contents
    qaskx -) qaskx: Auto generate server code
    qaskx -) qaskx: Auto generate sequence diagram
    qaskx -) qaskx: Auto generate gateway infra
    qaskx -) qaskx: Auto generate feature flags
    qaskx -) rediops: Auto update entries, including build, test
    qaskx -->>- term: Success

    alt Regsiter API if not already done

    term ->>+ qaskx: Register API
    Note over cmdb, git: qaskx rediops register cmd
    qaskx ->>+ rediops: Read 
    rediops -->>- qaskx: Contents
    qaskx ->>+ oas3f: Read 
    oas3f -->>- qaskx: Contents
    qaskx ->>+ apip: 
    apip -->>- qaskx: Registered
    qaskx -) rediops: Auto update API entry
    qaskx -->>- term: Success

    end

    term -->- vsc: close

    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: close

```

### Manual

The equivalent sequence of manual activity, non qaskx actions is as follows.
The **rediops** file is still used. Without **rediops** file you will 
follow whatever your existing process is and recorded the necessary 
details in various documents

The OpenAPI tool needs to be installed on the developer machine.

```mermaid

sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant cmdb as CMDB
    link vsc: Visual Studio @ https://code.visualstudio.com/
    participant term as Terminal
    participant git as Github
    link git: GitHub @ https://github.com/meerkat-manor/rediOps
    participant oas3f as OpenAPI file
    participant rediops as rediops file
    participant oas3 as OpenAPI tool
    participant apip as API portal


    Note over cmdb, vsc: Create new CI entry for API 
    dev ->>+ cmdb: Access UI
    cmdb -->> cmdb: Create CI entry
    cmdb -->>- dev: Close, noting CI value

    Note over git, rediops: The OpenAPI and redops files are stored in Git

    dev ->>+ vsc: start IDE

    Note over cmdb, vsc: Clone existing git for project
    vsc ->>+ git : 
    git -->>- vsc : Cloned, project opened

    vsc -) rediops: Update CI entry

    vsc ->>+ term: start
    Note over git, oas3: Set generation parameters
    term ->>+ oas3: Generate code cmd
    oas3 ->>+ oas3f: Read 
    oas3f -->>- oas3: Contents
    oas3 -->>- term: Success
    term -->- vsc: close

    vsc -) vsc: Update server code with defaults
    vsc -) vsc: Manually write sequence diagrams
    vsc -) vsc: Manually write Gateway infra
    vsc -) vsc: Manually write feature flags

    alt Regsiter API if not already done

    dev ->>+ apip: Register API
    apip -->>- dev: Registered

    end

    vsc -) rediops: Manually update entries

    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: Done


```

# End Status of flow

At the end of this flow the basic code stubs exist and have been committed
to Github.  The code can execute and will return not implemented
response results.


# Reading Notes

The Visual Studio Code, CMDB and Github components can be substitued for 
other software products such IntelliJ and Bitbucket.

