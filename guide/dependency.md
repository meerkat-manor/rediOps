# Dependency

The **dependency** section of the **devops.json** is for defining any downstream APIs.  An API can be:

* ODBC or JDBC connection
* REST
* FILE

For each dependency you can define the:

1. Asset ID: An identifier for the downstream asset such as a CMDB identifier.  
   This enables you to locate the details if you have a central database.
2. Protocol: The protocol that connects to the downstream component
3. URL: The resource location.  This has different meanings for each protocol

Like all sections, there is guide reference which can give further information
on how the section can be used.

## OBC or JDBC

The URL is the connection string, minus user and password information.  With credentials
the caller can enquire about the database schema

# REST

The URL is the OpenAPI specification document. With the OpenAPI document, the caller can 
discover the schema and if the specification includes, the servers publishing data using the
specification.

# File

The URL contains the HTTPS, SFTP, FTP location of the document describing the file
that is sent to or received from the remote location.


## Example

```json
    "dependency": {
        "guide": "https://github.com/meerkat-manor/rediOps/blob/main/guide/dependency.md",
        "apis": [
            {
                "asset_id": "AI560003",
                "protocol": "ODBC",
                "url": "postgresql://${{user}}:${{password}}@/tutorial1"
            },
            {
                "asset_id": "AI560044",
                "protocol": "REST",
                "url": "https://api.example.com/api/v1/openapi.yaml"
            }
        ],
        "tools": []
    }
```
