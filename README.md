# The dotnet.social community

This repository contains everything technical and organizational about the **dotnet.social community**.

The goal is to share as most details as possible **in public** with other people to gather ideas, help and suggestions about the management of this mastodon instance.

This community is small, only maintained for now by one person (@tbolon), but I found the idea of having a community on a @dotnet.social domain interesting, so I decided to take the bait.
Not because people should only speak about .NET here, but as a statement that .NET is part of our work-life and that we are proud of that.
It does not suggest that we should be narrow-minded or not interested in other technologies. In fact, I expect the complete opposite: to be curious, open-minded, and interested in all talks about our day-to-day domain: coding and technologies.

## Ask for help

I encourage you to participate in this repository if you have any resources, knowledge, energy or just time and motivation to help me and this community.

* Create [issues](https://github.com/dotnet-social/community/issues) if you have detected problems
* Use [discussions](https://github.com/dotnet-social/community/discussions) to ask questions, suggest ideas
* Use [mastodon](https://dotnet.social/home), mention me at [styx31@dotnet.social](https://dotnet.social/@styx31)
* Use discord to discuss in a less formal and more real-time way: https://discord.gg/Cn3HHqMyWK

## Content

We are (I am) looking for volunteers to help writing rules, discuss content, proof-reading, manage rules and bring more content to this repository and this organization.

Even (and firstly) rewrite this readme to correct all grammar mistakes!

## Technical details

The current dotnet.social server is a virtual machine hosted on **Microsoft Azure**, and located in West Europe.

It's a **Standard D2s v3 VM** with 2 vcpus and 8 GiB memory, running on Ubuntu 20.04.
The OS disk is a Premium SSL LRS of 30GiB. An additional data disk of 128GiB premium SSD LRS is attached to the virtual machine to store medias.

The resource group also contains a **storage account** (RA-GRS) used to backup all critical resources of the server daily.

I am looking for any help or advice, more particularly if you have experience in linux and/or Azure VM and services (CDN, etc.).

## Financial details

All these resources are billed under a single Azure subscription, a Visual Studio Enterprise Azure Credits Benefits that I (@tbolon) dedicate to this server.
The credits are of $130 per month and are almost entirely used by these resources.
I paid the domain on my own name, on gandi.net, until the end of 2024 (for 90€).

So, as of now, this community does not need external financial help.

But, as this instance grows, we will certainly face more charges and will perhaps require participation (donation?).

Also, as a community, we are also interested in free resources and sponsorship if it makes sense: for example, an Azure sponsorship, monitoring tools free credits, or anything that could help this community. **If you are members of this community and can help by providing resources, feel free to contact us.**

## Scripts and maintenance

This repository is also cloned on the server itself and contains scripts which are used to maintain and administrate the server.
This way, everyone can look at the configuration, scripts, and attest how things are done and make any suggestion to help make this server more robust.

* the `/scripts` folder to find all scripts used on the server
* the `/configs` folder contains all configuration files copied from the server when they are modified

Data on the server are copied on the azure blob storage account each night, using the `/scripts/backup.sh` script.
This script upload backup data each day, keeping last 7 days by using the current day of week as a part of the remote url.

If any maintenance is scheduled, it will be announced on the mastodon instance, on my mastodon account and an issue will be created here in case something goes wrong and I need to post updates. I will also be reachable on discord.

I also have setup a simple status page here: https://stats.uptimerobot.com/0PKV1ukWWx

## Mastodon instance

TODO: explain how mastodon was installed and the differences applied, more precisely regarding the location of the public files on `/datadrive/`
