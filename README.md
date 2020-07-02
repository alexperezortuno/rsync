# simple-docker-rsync

A simple ssh, crontab rsync server/client Docker image to easily rsync data within Docker volumes

## Example Docker-compose
```
version: "3.2"

services:
    rsync:
        image: rsync:dev
        restart: on-failure
        environment:
            - RSYNC_CRONTAB=* * * * * # Time to execute http://crontab.guru
            - RSYNC_HOST_IP=192.168.0.1 # Host IP
            - RSYNC_HOST_FOLDER=/home/synced-data/ # Host Folder
            - RSYNC_SSHPASS=123456 # Optional 
        volumes:
            - ./logs:/home/rsyncron/logs:z
            - ./sync-data:/home/rsyncron/synced-data:z
```

## Default Variables

RSYNC_CRONTAB=""

RSYNC_HOST_USER="root"

RSYNC_HOST_FOLDER="/"

RSYNC_HOST_PORT 22

RSYNC_LOCAL_FOLDER="synced-data"

RSYNC_HOST_IP="127.0.0.1"

RSYNC_UID 89788

RSYNC_GID 89788

RSYNC_USER="rsyncron"

RSYNC_PULL 1

RSYNC_PUSH 0

RSYNC_SSHPASS=""
