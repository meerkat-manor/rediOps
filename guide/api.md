# API

The **api** section of the **devops.json** is used to locate the API
specification for the component.  The specification is commonly in
OpenAPI format.

The information can be used to:

* Review the capabilities expose bu the service
* Call the service if included in the specification
* Generate code, eithers server based or client code 

Multiple versions can be published and it is up to the consumer
to determine which version to use.  For example both 
a YAML and JSON versions of the OpenApi specification can be published.

Like all sections, there is guide reference which can give further information
on how the section can be used.

## Engine

The engine identifies the accessor for the API.

The two accessors to consider are:

* GIT : this is the git location of the file within the repository
* REST : A REST / Web based access to the API specification
