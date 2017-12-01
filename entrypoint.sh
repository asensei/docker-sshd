#!/bin/sh

# generate host keys if not present
ssh-keygen -A

# copy authorized_keys if present
[ -n "${AUTHORIZED_KEYS}" ] \
  && cp ${AUTHORIZED_KEYS} ~/.ssh/authorized_keys

# fix permissions if writable
[ -w ~/.ssh/authorized_keys ] \
    && chown root:root ~/.ssh/authorized_keys \
    && chmod 600 ~/.ssh/authorized_keys;
[ -w ~/.ssh ] \
    && chown root:root ~/.ssh \
    && chmod 700 ~/.ssh;

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"
