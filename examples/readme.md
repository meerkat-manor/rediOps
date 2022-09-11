# Examples

The examples provided are opinionated and may not be a fit for you.

The code is not optimised and is only intended to present 
more concrete examples of various use cases.


## Refresh an executing docker image

Build a static web server and refresh the existing
executing static web server.

* Code is located at [deploy.ps1](src/powershell/static/deploy.ps1)
* Tutorial is located at [staticweb](../guide/tutorial/staticweb.md)

## Generate Go web service code

Using a OpenAPI specification for a service, this example
generates the server and type code.  The example uses the **rediops.json** definition itself 
to generate the server code.


* Code is located at [deploy.ps1](src/powershell/microsservice/deploy.ps1)
* Tutorial is located at [microservice](../guide/tutorial/microservice.md)