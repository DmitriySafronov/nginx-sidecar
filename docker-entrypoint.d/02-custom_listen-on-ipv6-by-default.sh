#!/usr/bin/env bash

set -e

# nginx.conf doesn't support environment variables, so we substitute at run time.
## proxy.conf substitutions:

/bin/sed \
  -e "s/<NGINX_PORT>/${NGINX_PORT:-80}/g" \
  -e "s/<NGINX_STATUS_PORT>/${NGINX_STATUS_PORT:-81}/g" \
  /usr/local/etc/nginx/10-listen-on-ipv6-by-default.sh.template > /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh

chmod a+x /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
