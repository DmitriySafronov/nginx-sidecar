#!/usr/bin/env bash

set -e

# nginx.conf doesn't support environment variables, so we substitute at run time.
## proxy.conf substitutions:

/bin/sed \
  -e "s/<NGINX_PORT>/${NGINX_PORT:-80}/g" \
  -e "s/<NGINX_CLIENT_BODY_BUFFER_SIZE>/${NGINX_CLIENT_BODY_BUFFER_SIZE:-8k}/g" \
  -e "s/<NGINX_CLIENT_MAX_BODY_SIZE>/${NGINX_CLIENT_MAX_BODY_SIZE:-5M}/g" \
  -e "s/<NGINX_STATUS_PORT>/${NGINX_STATUS_PORT:-81}/g" \
  -e "s:<NGINX_STATUS_ALLOW_FROM>:${NGINX_STATUS_ALLOW_FROM:-all}:g" \
  /usr/local/etc/nginx/server.conf.template > /etc/nginx/snippets/server.conf
