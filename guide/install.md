# Install

The install section is to enable the discovery of the functions
to use when a install of the component is required.

The definition does not include details about the server or infrastructure
as these can vary.  This is definition works similar to the Ansible 
inventory and playbooks.

The same instructions for installation can be used for both non-production
and production installation if the environment attributes are
soft coded.

## Engine

The engine identifies the processor for the refresh.

For Ansible, the parameters are defined in the "playbook".

For Command, the commands or script to execute are defined in the "commands"

## Playbook


## Commands

The commands allows for commands to be defined either in the definition or the commands
as found in a file, where such a file can (should) be stored on the source version control
system (e.g. Git)

If the install commands are stored in a file in Git, then they can be amended there and tested 
without changing the contents of the devops.json file.

## Example

```json
    "install": {
        "guide": "https://github.com/meerkat-manor/rediOps/blob/main/guide/install.md",
        "engine": "COMMAND",
        "playbook": "",
        "commands": {
            "pre": [],
            "script": "/deploy/install.sh",
            "post": []
        }
    }
```
