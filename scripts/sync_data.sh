#!/bin/bash

DATE_AND_TIME=`date "+%d-%m-%y_%H-%M-%S"`

if [[ $RSYNC_PULL -eq 1 ]]
then
echo "[${DATE_AND_TIME}] Pulling from ${RSYNC_HOST_IP}"
rsync --verbose -e "${RSYNC_SSHPASS} ssh -p ${RSYNC_HOST_PORT}" --recursive --progress --human-readable --archive --compress --delete ${RSYNC_HOST_USER}@${RSYNC_HOST_IP}:${RSYNC_HOST_FOLDER} /home/${RSYNC_USER}/${RSYNC_LOCAL_FOLDER}
fi

if [[ $RSYNC_PUSH -eq 1 ]]
then
echo "[${DATE_AND_TIME}] Pushing to ${RSYNC_HOST_IP}"
rsync --verbose -e "${RSYNC_SSHPASS} ssh -p ${RSYNC_HOST_PORT}" --recursive --progress --human-readable --archive --compress --delete /home/${RSYNC_USER}/${RSYNC_LOCAL_FOLDER} ${RSYNC_HOST_USER}@${RSYNC_HOST_IP}:${RSYNC_HOST_FOLDER}
fi
