![LGSM](https://user-images.githubusercontent.com/29210664/208509402-ddc13e09-be91-40b7-aa7f-9a701a482c67.png)

<h1 align="center">Linux Gameserver Manager Gamemaster</h1>

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
* Ansible => 2.13.6
* Python3 => 3.9.2

Copy over the files from `setup` folder to correct places indicated in the first line of each file.
Alternatively you can use the `setup.sh` script to do this for you. (NOTE: This script expects to be ran from the `setup` folder using `bash`)

```bash
cd setup/
./setup.sh
```

Configure settings for the tournament under `inventory/group_vars/CounterStrikeServers/vars.yml`

Export the tournament list from Challonge and save it under `roles/get5api/files/<challonge_tournament_id>.csv`

Get Steam API key from [here](https://steamcommunity.com/dev/apikey) and add it to `inventory/group_vars/CounterStrikeServers/vault.yml` 

Get Challonge API key from [here](https://challonge.com/settings/developer) and add it to `inventory/group_vars/CounterStrikeServers/vault.yml`

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
