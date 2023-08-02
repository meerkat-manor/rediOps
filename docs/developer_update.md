# Developer update flow

_This document is intended to cover the scenario where the **devops** 
file contents change including references to OpenAPI specifications._

## Update the OpenAPI specification

The OpenAPI specification as linked to the publishing server
is updated first.

```mermaid
---
title: Business Analyst update task flow
---
sequenceDiagram

    actor ba as Business Analyst
    participant ide as ApiCurio
    participant git as Github
    participant oas3f as OpenAPI file

    Note over git, oas3f: The OpenAPI file is stored in Git

    ba ->>+ ide: start IDE

    ide ->> ide: Update API specification
    ide ->> ide: Create / alter data structures
    Note over ba, oas3f: Data structures include requests and responses
    ide ->> ide: Create / alter new paths and methods
    Note over ba, oas3f: Includes non 200 response handling, headers and security
    ide ->> ide: Update the specification version
    
    ide ->>+ git: Commit to git
    git ->>+ oas3f: OpenAPI file under Git
    oas3f -->>- git: Saved
    git --) git: Trigger GitActions for lint
    git -->>- ide: 

    ide -->>- ba: close

```

## Server update

Once the OpenAPI definition has been updated the server code needs to be
re-generated as the publisher of the API.

```mermaid
---
title: Server development update task flow
---
sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant term as Terminal
    participant qaskx as qaskx-cli
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

    vsc ->>+ term: start

    term ->>+ qaskx: Generate code
    Note over qaskx, cmdb: qaskx-cli gen server cmd
    qaskx ->>+ devops: Read 
    devops -->>- qaskx: Contents

    qaskx ->>+ oas3f: Read 
    oas3f -->>- qaskx: Contents
    qaskx -) qaskx: Auto generate server code
    opt
    qaskx -) qaskx: Auto generate sequence diagram
    end
    qaskx -->>- term: Success

    term -->- vsc: close

    rect grey
    Note over vsc, qaskx: Code updates to use the updated OpenAPI definition
    vsc -->> vsc: Code update
    vsc -->> vsc: Local build
    vsc -->> vsc: Local test
    end
    
    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: close

```


## Client update

Once the OpenAPI definition has been updated the client code needs to be
re-generated as the consumer of the API.


```mermaid
---
title: Client development update task flow
---
sequenceDiagram

    actor dev as Developer
    participant vsc as Visual Studio Code
    participant term as Terminal
    participant qaskx as qaskx-cli
    participant git as Github
    link git: GitHub @ https://github.com/meerkat-manor/devops
    participant oas3f as OpenAPI file
    participant devops as devops file

    dev ->>+ vsc: start IDE

    Note over vsc, term: Clone existing git for project
    vsc ->>+ git : 
    git -->>- vsc : Cloned, project opened

    vsc ->>+ term: start

    term ->>+ qaskx: Generate code
    Note over qaskx, cmdb: qaskx-cli gen client cmd
    qaskx ->>+ devops: Read dependency list
    devops -->>- qaskx: Contents
    loop Read called dependencies
    qaskx ->>+ oas3f: Read dependency
    oas3f -->>- qaskx: Contents
    qaskx -) qaskx: Auto generate client code
    end
    opt
    qaskx -) qaskx: Auto generate sequence diagram
    end
    qaskx -->>- term: Success

    term -->- vsc: close

    rect grey
    Note over vsc, qaskx: Code updates to use the updated OpenAPI definition
    vsc -->> vsc: Code update
    vsc -->> vsc: Local build
    vsc -->> vsc: Local test
    end

    vsc ->>+ git: Commit
    git --) git: Trigger GitActions for lint, gateway, features, etc 
    git ->>- vsc: Success

    vsc -->>- dev: close

```

The code is now updated with the latest OpenAPI definition

# End Status of flow

At the end of this flow the code has been updated with latest 
definitions.

# Reading Notes

Using code generators will break the code in many situations and
therefore using Git and diff tools will help in identifying
what has changed and perform impact analysis.

In many situations with specification changes the compiler
will pick up the changes. Some changes can only be detected
at run time if there is a high level of abstraction.
