# Build

The **build** section of the **devops.json** is used to build the component.

The build action would include the location of any build scripts or 
configuration files. Like all sections, there is guide reference which can give further information on how the section can be used within your
environment.

If you are using common build pipelines in your CI/CD then 
the linked URL might be

* An azure-pipelines.yml as used in Azure Devops
* A declarative Jenkinsfile used by Jenkins/Hudson



## Azure pipelines

A sample definition for Azure pipelines is:

```json
    "build": [
        {
            "engine": {
                "category": "BUILD",
                "name": "AZURE PIPELINE"
            },
            "config": "build/pipelines/azure-pipelines.yml",
        }
    ],
```

If the Git is hosted on Azure and you want to use Azure pipelines, you
need to create the above file in the root Git directory with the relevant
details. ( You can also specify a different location. )

You can create a pipeline using the command:

```
az pipelines create -name "Default" --description "Generated pipeline" -- folder-path "build/pipelines" --repository-type tfsgit --skip-run true
```

All of this can be done using a simple Powershell script based on the
**devops** definition and can be executed at the time of creating the 
definition.
