# Overview

The objective is to produce a specification that can be stored with the source code and can be used
to locate files used by the DevOps process.

## Background

Existing DevOps tools make assumptions or are configured as webhooks, which are outside of the 
source code.  By capturing the assumptions with the code, there is less risk of errors or
missed processes.

## Design

The approach with the specification is to create a file in a specified format in 
**.well-known/devops.json** location within your source.  The format has placeholders for various
activities of DevOps.

The specification does not mandate the tools to use but provides a location
in the json where configuration files and other files are located in
the source folder structure.

This allows the source code to be portable and the resource
to be rebuilt using the same tools and process.


## Automation


### Using the DevOps.json file

Depending on your tools, there are various ways to get the benefits
provided by the DevOps.json file.

The simplest case is if you have a simple setup and don't require
complex tool, is to define a simple bash script file in source
and name that source file as the install or refresh script.

This bash script's location is then saved to devops.json

See [Tutorials](tutorial/readme.md) for some ideas.


## Generating the DevOps.json file

If you want consistency you can generate the devops.json file
from a template and prefill the data based on your organisations
preferred DevOps tools.

If you tools change or you import projects from other organisations
or Open Source then the values can be changed per project without
impacting existing projects.

