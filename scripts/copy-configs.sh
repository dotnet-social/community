#!/bin/bash

# This script is used to copy all non-sensitive config files to this repository
#
# It is expected to be run on-demand when a modification is made on any of the files copied
#
# All commands are run under the non-root mastodon account
#
# Environment
#
# MASTO_LIVE="/home/mastodon/live"                  # app is installed in /home/mastodon/live
# MASTO_PUBSYS="/datadrive/mastodon-public/system"  # public/system/ directory has be moved to /datadrive/mastodon-public/system
# MASTO_BACKUP="/datadrive/backup"                  # backup directory is /datadrive/backup
# MASTO_GITHUB="/home/mastodon/github"              # local clone location of the  https://github.com/dotnet-social/server.git repository

# backup nginx config
cp -av /etc/nginx/sites-available/mastodon ${MASTO_GITHUB}/config/nginx.conf

# backup systemd config
cp -av /etc/systemd/system/mastodon-*.service ${MASTO_GITHUB}/config