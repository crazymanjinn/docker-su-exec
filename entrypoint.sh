#!/bin/bash

[[ ! -z ${ENTRY_DEUBG+x} ]] && set -x

USER_SPEC="${USER_SPEC:-0:0}"

if [[ ! -z ${CHOWN_DIRS+x} ]]; then
    for DIR in $CHOWN_DIRS; do
        chown -R "$USER_SPEC" $DIR
    done
fi

if [[ "$USER_SPEC" != "0:0" ]]; then
    gid=${USER_SPEC#*:}
    groupadd -f -g $gid user
    useradd -om -g $gid -u ${USER_SPEC%:*} user
    export HOME=/home/user
    chown -R "$USER_SPEC" $HOME
    exec su-exec "$USER_SPEC" "$@"
fi

exec "$@"
