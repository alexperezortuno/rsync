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
            - RSYNC_REMOTE_HOST=192.168.0.1 # Host IP
            - RSYNC_REMOTE_FOLDER=/home/synced-data/ # Host Folder
            - RSYNC_SSHPASS=sshpass -p '123456' # Optional 
        volumes:
            - ./logs:/home/rsyncron/logs:z
            - ./sync-data:/home/rsyncron/synced-data:z
```

## Default Variables

RSYNC_CRONTAB=""

RSYNC_REMOTE_USER="root"

RSYNC_REMOTE_FOLDER="/"

RSYNC_REMOTE_PORT 22

RSYNC_LOCAL_FOLDER="synced-data"

RSYNC_REMOTE_HOST="127.0.0.1"

RSYNC_FROM_HOST="127.0.0.1"

RSYNC_UID 89788

RSYNC_GID 89788

RSYNC_USER="rsyncron"

RSYNC_PULL 1

RSYNC_PUSH 0

RSYNC_SSHPASS=""
