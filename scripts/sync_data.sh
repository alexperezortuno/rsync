#!/bin/bash

DATE_AND_TIME=`date "+%d-%m-%y_%H-%M-%S"`
RSYNC_SSHPASS_VAR=""

if [[ ! -z "$RSYNC_SSHPASS" ]]
then
    RSYNC_SSHPASS_VAR="sshpass -p '${RSYNC_SSHPASS}'"
fi

if [[ $RSYNC_PULL -eq 1 ]]
then
echo "[${DATE_AND_TIME}] Pulling from ${RSYNC_REMOTE_HOST}"
rsync --verbose -e "${RSYNC_SSHPASS_VAR} ssh -p ${RSYNC_REMOTE_PORT}" --recursive --progress --human-readable --archive --compress --delete ${RSYNC_REMOTE_USER}@${RSYNC_REMOTE_HOST}:${RSYNC_REMOTE_FOLDER} /home/${RSYNC_USER}/${RSYNC_LOCAL_FOLDER}
fi

if [[ $RSYNC_PUSH -eq 1 ]]
then
echo "[${DATE_AND_TIME}] Pushing to ${RSYNC_REMOTE_HOST}"
rsync --verbose -e "${RSYNC_SSHPASS_VAR} ssh -p ${RSYNC_REMOTE_PORT}" --recursive --progress --human-readable --archive --compress --delete /home/${RSYNC_USER}/${RSYNC_LOCAL_FOLDER} ${RSYNC_REMOTE_USER}@${RSYNC_REMOTE_HOST}:${RSYNC_REMOTE_FOLDER}
fi
