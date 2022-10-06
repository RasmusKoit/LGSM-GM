# LGSM-GM

Automatically generate X number of servers and manage them.

## TODO

1. Create docker-compose.yml file with template using loop
2. Create config files with template using loop
3. Create task for installing server
4. Create task for starting/stopping all servers
5. Create task for starting/stopping single server
6. Create webserver that brings in servers

## Getting started

### Setup

#### First run

First install the base CSGO server files

```bash
apt install python3 git -y
adduser csgoserver
su - csgoserver
wget -O linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
mv csgoserver csgoserver-base
./csgoserver-base install
```

After the base installation has finished generate X number of config files

```bash
python3 generate-configs.py
```

#### Managing server

:)
