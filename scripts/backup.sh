#!/bin/bash

# Strategy
# 1) Backup all config files: .env.production, .nginx, systemd
# 2) Backup postgresql
# 3) Backup system/public user files
#
# All commands are run under the non-root mastodon account
#
# Environment
#
# MASTO_LIVE="/home/mastodon/live" 					# app is installed in /home/mastodon/live
# MASTO_PUBSYS="/datadrive/mastodon-public/system"	# public/system/ directory has be moved to /datadrive/mastodon-public/system
# MASTO_BACKUP="/datadrive/backup"					# backup directory is /datadrive/backup
#
# azcopy has been installed in ~/azcopy directory
#
# AZ_BLOB_MASTO_URL="https://xxx.blob.core.windows.net/yyy" # azure container URL
# AZ_BLOB_MASTO_SIG="sp...&sig=..." 						# azure container SAS
#
# Inspirations / references:
# https://github.com/HasHooves/mastodon-backup/blob/master/backup.sh
# https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azcopy-v10

# load env secrets
. $HOME/.secrets

# store day of week
DOW=$(date +%u)
echo $DOW

# 1 directory for each day of week
mkdir -p ${MASTO_BACKUP}/${DOW}
MASTO_BACKUP=${MASTO_BACKUP}/${DOW}

# Backup config files
cp -av ${MASTO_LIVE}/.env.production ${MASTO_BACKUP}/.env.production
cp -av /etc/nginx/sites-available/mastodon ${MASTO_BACKUP}/nginx.conf
cp -av /etc/systemd/system/mastodon-*.service ${MASTO_BACKUP}

# Backup postgresql
cd ${MASTO_LIVE}
pg_dump -v -Fc mastodon_production > ${MASTO_BACKUP}/mastodon_production.dump

# Backup system-public user files
rm ${MASTO_BACKUP}/pub-sys.tar
tar -C ${MASTO_PUBSYS} -cvf ${MASTO_BACKUP}/pub-sys.tar --exclude='./cache/*' .

# Backup this script file
cp -av ~/backup.sh ${MASTO_BACKUP}

# Upload files
~/azcopy/azcopy copy "${MASTO_BACKUP}/" ${AZ_BLOB_MASTO_URL}?${AZ_BLOB_MASTO_SIG} --recursive
