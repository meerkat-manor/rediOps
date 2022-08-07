# rediOps

Rediscover DeveOps is about standardising how to find information about the code, specifically for use in the DevOps pipeline and 
for engineers to locate relavant information about the code and its capability and DevOps process.

The information resides with the code in the code repository, commonly Git, and is human readable and also understood by tools.

RediOps takes the lead from the the **.well-known** folder approach used in web pages for source.  
That is the creation of a folder named ".well-known" and to create a file by the name of 
**"devops.json"** within the folder. This will allow tools to retrieve the file if it exists
and to use the information for activities such as:

* build
* deploy
* discover APIs definitions

## Background

A common approach organisations have is to create well known, at least within the organisation, 
file names within Git repositories and then configure tools to access those files for their configuration 
and execution.

The proposal here is to define one DevOps file location and the content within to provide location information
for other files or actions to perform.

## Specification 

The specification for the **devops.json** is defined as an OpenAPI document allowing the publishing 
of hte information also as a REST service if so required - though this is not mandatory - and 
the "devops.json" file is expected to exist before the code is deployed.

If you do publish the information as a REST service then you should consider protecting access to
the data, especially if it contains data that may expose internal structures.

**Note:** The specification does not capture credentials or runtime environment information.

## Audience

If your organisation already has standrad automation tools and pipeline process, then you may not find the RediOps 
and the specifications that useful.

You may find the specification useful if:

1. You are a small developer with custom tools or simple requirements
2. Your organisation has many different tools for different repositories and you need to document which tool goes with what 

