# LGSM-GM

Automatically generate XX number of Counter Strike: Global Offensive servers and manage them. 

This project uses Ansible, Docker and work of other talented developers across GitGub such as [GameServerManagers](https://github.com/GameServerManagers/LinuxGSM) for creating the LinuxGSM, [splewis](https://github.com/splewis/get5) for creating the get5 plugin, [PhlexPlexico](https://github.com/PhlexPlexico/G5API) for creating a working frontend for get5 and [Igor Golm](https://github.com/igorgolm) with his code reviews and tutoring.

[LGSM-GM page](https://github.com/RasmusKoit/LGSM-GM) 

[LGSM-Docker page](https://github.com/RasmusKoit/LinuxGSM-Docker)

## Getting started

```bash
git clone git@github.com:RasmusKoit/LGSM-GM.git
cd LGSM-GM/
```

## Setup

Requirements:
* Ansible => 2.10.8
* Python3 => 3.9.2

Copy over the files from `setup` folder to correct places indicated in the first line of each file.

Configure settings for the tournament under `inventory/group_vars/CounterStrikeServers/vars.yml`



## First run

During first run you will not have all the `vault_` variables defined under `inventory/group_vars/CounterStrikeServers/vault.yml`
for example `vault_get5api_key`

```bash
cd LGSM-GM
ansible-playbook -i ../inventory/development linux_prep.yml
ansible-playbook -i ../inventory/development lgsm.yml
```

Now that that the stack is running, go over to your server
(ex: `https://lgsm-dev.norwayeast.cloudapp.azure.com`)

Authenticate with your Steam account (this can be configured under `inventory/group_vars/CounterStrikeServers/vars.yml` by modifying `tournament_server_admins`)

Get your `vault_get5api_key` value under user account and set it into the vault.
Also go ahead and set your challonge API Key under the user profile.

Now you are ready to run the playbooks related to get5

```bash
cd LGSM-GM
ansible-playbook -i ../inventory/development get5api.yml
```

## Managing server

TODO

### Special thanks/Shoutout

* https://github.com/splewis/
* https://github.com/PhlexPlexico/ 
* https://github.com/GameServerManagers/LinuxGSM
* https://github.com/igorgolm
