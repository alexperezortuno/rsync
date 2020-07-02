#!/bin/bash

rsync --version
USER_EXIST=$(grep -c "^${RSYNC_USER}:" /etc/passwd)

if [[ $USER_EXIST -eq 1 ]]
then
    echo "The user ${RSYNC_USER} exists"
else
    addgroup -g ${RSYNC_GID} ${RSYNC_USER}
    adduser -D -u ${RSYNC_UID} -G ${RSYNC_USER} ${RSYNC_USER}
    echo "The user ${RSYNC_USER} has been added"
fi

if [[ ! -d "~/.ssh" ]]
then
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
    touch /home/${RSYNC_USER}/logs/cron.log
else
    cat /dev/null > /home/${RSYNC_USER}/logs/cron.log
fi

chmod +x /sync_data.sh
chown ${RSYNC_USER}:${RSYNC_USER} -R /sync_data.sh

ssh-keyscan -H ${RSYNC_REMOTE_HOST} >> ~/.ssh/known_hosts
echo -e "${RSYNC_CRONTAB} sh /sync_data.sh >> /home/${RSYNC_USER}/logs/cron.log 2>&1" >> /crontab
/usr/bin/crontab /crontab && /usr/sbin/crond -f
