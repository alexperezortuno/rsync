FROM alpine:3.12

ENV RSYNC_CRONTAB=""
ENV RSYNC_REMOTE_USER="root"
ENV RSYNC_REMOTE_FOLDER="/"
ENV RSYNC_REMOTE_PORT 22
ENV RSYNC_LOCAL_FOLDER="synced-data"
ENV RSYNC_REMOTE_HOST="127.0.0.1"
ENV RSYNC_FROM_HOST="127.0.0.1"
ENV RSYNC_UID 89788
ENV RSYNC_GID 89788
ENV RSYNC_USER="rsyncron"
ENV RSYNC_PULL 1
ENV RSYNC_PUSH 0
ENV RSYNC_SSHPASS=""

RUN apk add --no-cache --update rsync ca-certificates openssh-client bash sshpass grep sed
RUN rm -rf /tmp/*
RUN rm -rf /var/cache/apk/*

EXPOSE 873

COPY scripts /

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
