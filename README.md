# rediOps

Rediscover DevOps (rediOps) is about standardising how to find information about the code, specifically 
for use in the DevOps pipeline and for engineers to locate relavant information about the code and 
its capability and DevOps process.

The information resides with the code in the code repository, commonly Git, and is human readable
and also understood by tools.

RediOps takes the lead from the the [**.well-known** folder](https://en.wikipedia.org/wiki/Well-known_URI) 
approach used in web servers.  
That is the creation of a folder named ".well-known" and to create a file by the name of 
**"devops.json"** within the folder. This will allow tools to retrieve the file if it exists
and to use the information for activities such as:

* build
* deploy
* discover OpenAPI definitions

## What does it do

The **.well-known/devops.json** specification removes devops process 
assumptions, such as script locations. It also provides a location
to store application reference links such a OpenAPI definitions.
All this with the code on Git / source version control.

You may already have a devops toolchain for build and deploy but many require
you to enter the Git details into them.  By having a **devops** definition as
described here you can further automate the process - and have a roadmap
to change tooling if circumstances change.

Some automation to the process can be achieved by executing simple
scripts at the start of the project. 

If you decide that **.well-known/devops.json** is not for you
maybe some of the concepts may provoke some improvements into 
your current process.

## What doesn't it do

The **devops** definition does not replace your existing tools or processes.



## Background

A common approach organisations have is to create well known, at least within the organisation, 
file names within Git repositories and then configure tools to access those files for their configuration 
and execution.

These well known organisation files tend to reside in the root directory
or some well known directory such as "tools" or "build".  As you include 
more tools and processes the number of these files grow in the root
directory.

The proposal here is to define one DevOps file location and the content 
within to provide location information for other files or actions to 
perform.

## Specification 

The specification for the **devops.json** is defined as an [OpenAPI document](specification/rediops.json).

The use of OpenAPI to define the details specification provides a format and protocol that can be understood
by tools and engineers.

Using a OpenAPI specification provides clarity on definition. Tools can also generate a 
REST service if so required - though this is not mandatory - and 
the "devops.json" file is expected to exist before the code is deployed.

If you do publish the information as a REST service then you should consider protecting access to
the data, especially if it contains data that may expose internal structures.

**Note:** The specification does not capture credentials or runtime environment information.

To read more see [overview](guide/overview.md) or
go to [tutorial](tutorial/readme.md) or
[examples](examples/readme.md)

## Audience

You may find the specification useful if:

1. You don't have a standard and make assumptions about meta data file names in your Git repository
2. You are a small developer with custom tools or simple requirements
3. Your organisation has many different tools for different repositories and you need to document which tool goes with what 

If your organisation already has standard automation tools and pipeline process, then you may not find the rediOps 
and the specifications that useful.  If the specification is not relevant in its entirety, maybe you find the
concept or portions useful for adaptation in your organisation.

## SBOM

With increased attention on software supply chains and the need to 
create and update the software bill of materials (SBOM), the 
proposed definition is flexible to linking to SBOM tools if required.

Your existing tooling may already cater for SBOM creation so please
check.  If your existing tools do cover SBOM then you could link
the results to the **devops.json** definition so that it is 
closer to the source.

See the link for more information on [SBOM](guide/sbom.md)
