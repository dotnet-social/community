# The dotnet.social server

This repository contains everything technical about the server hosting the dotnet.social community.

The goal is to share as most details as possible with other people to gather ideas, help and suggestions about the hosting of this mastodon instance.

We encourage you to participate in this repository if you have any resources, knowledge, energy or just time and motivation to help maintain this community.

## Technical details

The current dotnet.social server is a virtual machine hosted on Microsoft Azure, and located in West Europe.

It's a Standard D2s v3 VM with 2 vcpus and 8 GiB memory, running on Ubuntu 20.04.

The OS disk is a Premium SSL LRS of 30GiB. An additional data disk of 128GiB premium SSD LRS is attached to the virtual machine.

The resource group also contains a storage account (RA-GRS) used to backup all critical resources of the server daily.

## Scripts and maintenance

This repository is also cloned on the server itself and contains scripts which are used to maintain and administrate the server.
This way, everyone can look at the configuration, scripts, and attest how things are done and make any suggestion to help make this server more robust.

* the `/scripts` folder to find all scripts used on the server
* the `/configs` folder contains all configuration files copied from the server when they are modified

Data on the server are copied on the azure blob storage account each night, using the `/scripts/backup.sh` script.
This script upload backup data each day, keeping last 7 days by using the current day of week as a part of the remote url.

## Mastodon instance

TODO : explain how mastodon was instaled and the differences applied, more precisely regarding the location of the public files on `/datadrive/`