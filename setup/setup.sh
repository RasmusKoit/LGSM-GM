#!/bin/bash

# Check if this script is run from setup directory
if [ ! -f setup.sh ]; then
    echo "Please run this script from setup directory"
    exit 1
fi

# Copy over development file to the correct location
echo "Copying development file to correct location ../inventory/development"
if [ -f ../inventory/development ]; then
    echo "development file already exists"
    read -p "Are you sure you want to overwrite? (y/n) " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting"
        exit 1
    fi
fi
cp development ../inventory/development

# Copy over vault.yml to the correct location
echo "Copying vault.yml to correct location ../inventory/group_vars/CounterStrikeServers/vault.yml"
if [ -f ../inventory/group_vars/CounterStrikeServers/vault.yml ]; then
    echo "../inventory/group_vars/CounterStrikeServers/vault.yml file already exists"
    read -p "Are you sure you want to overwrite? (y/n) " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting"
        exit 1
    fi
fi
cp vault.yml ../inventory/group_vars/CounterStrikeServers/vault.yml

# Copy over ansible.cfg to the correct location
echo "Copying ansible.cfg to the correct location ~/.ansible.cfg"
if [ -f ~/.ansible.cfg ]; then
    echo "~/.ansible.cfg file already exists"
    read -p "Are you sure you want to overwrite? (y/n) " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "Exiting"
        exit 1
    fi
fi
cp ansible.cfg ~/.ansible.cfg

echo "Setup complete"
exit 0