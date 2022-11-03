#!/usr/bin/env bash

set -e

# nginx.conf doesn't support environment variables, so we substitute at run time.
## proxy.conf substitutions:

/bin/sed \
  -e "s/<NGINX_PROXY_BUFFER_SIZE>/${NGINX_PROXY_BUFFER_SIZE:-8k}/g" \
  -e "s:<NGINX_PROXY_TIMEOUT>:${NGINX_PROXY_TIMEOUT:-60s}:g" \
  -e "s/<APP_SCHEME>/${APP_SCHEME:-http}/g" \
  -e "s/<APP_HOST>/${APP_HOST:-app}/g" \
  -e "s/<APP_PORT>/${APP_PORT:-8080}/g" \
    /usr/local/etc/nginx/proxy.conf.template > /etc/nginx/snippets/proxy.conf
