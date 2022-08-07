# Refresh 

The refresh section is to enable the discovery of the functions
to use when a refresh of the component is required.

## Engine

The engine identifies the processor for the refresh.

For Ansible, the parameters are defined in the "playbook".

For Command, the commands or script to execute are defined in the "commands"

## Playbook


## Commands

The commands allows for commands to be defined either in the definition or the commands
as found in a file, where such a file can (should) be stored on the source version control
system (e.g. Git)

If the refresh commands are stored in a file in Git, then they can be amended there and tested 
without changing the contents of the devops.json file.

## Example

```json
    "refresh": {
        "guide": "https://github.com/meerkat-manor/rediOps/blob/main/guide/refresh.md",
        "engine": "COMMAND",
        "playbook": "",
        "commands": {
            "pre": [],
            "script": "/deploy/refresh.sh",
            "post": []
        }
    }
```
