#!/bin/sh
set -e

echo "$SYNC_PASSWORD" > /etc/lsyncd/d2c-rsyncd.password
echo "d2c:$SYNC_PASSWORD" > /etc/rsyncd/d2c-rsyncd.secrets
chmod 0600 /etc/lsyncd/d2c-rsyncd.password /etc/rsyncd/d2c-rsyncd.secrets

rm -rf /var/run/rsyncd.pid /var/run/lsyncd.pid

exec "$@"
