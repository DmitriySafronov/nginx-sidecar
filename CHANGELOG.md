# `nginx-sidecar` changelog

## 0.4.0

- Enabling the support of caching and websockets
- Some variables were renamed, see `entrypoint.sh`
- New variables are:
  - `NGINX_CLIENT_BODY_BUFFER_SIZE` - it sets client_body_buffer_size (default: 8k).
  - `NGINX_CLIENT_MAX_BODY_SIZE` - it sets client_max_body_size (default: 5M).
  - `APP_SCHEME` - it sets application scheme (default: http).
  - `NGINX_PROXY_BUFFER_SIZE` - it sets proxy_buffer_size (default: 8k).

## 0.3.8

- Enabling the support of custom timeout for proxy requests
- New variable is: `PROXY_TIMEOUT` - it sets proxy_connect_timeout, proxy_send_timeout, proxy_read_timeout values. (default: 60s)

## 0.3.7

- Enabling ngnix status for detailed monitoring.
- New variables are:
  - `NGINX_STATUS_PORT` (default `81`) a port to run the status module on
  - `NGINX_STATUS_ALLOW_FROM` (default `all`) IP, CIDR, `all` for the nginx config's `allow` statement (http://nginx.org/en/docs/http/ngx_http_access_module.html)

## 0.3.6

- Allow specifying the app hostname to proxy to.

## 0.3.5

- Increase the size of the buffer that stores the response headers to 8K.

## 0.3.4

- Add `$upstream_status` to the nginx access log line

## 0.3.3

- Add `--fail` to the curl health check. This causes curl to return non-zero exit codes
  even if the http request completes but the response code represents an error.
- Add `--verbose` to the curl health check. This helps us debug any application responses
  if the server does start, but with errors.

## 0.3.2

- Use `$request_method` and `$request_uri` instead of the combined `$request`.

## 0.3.1

- Log `$request_time`; request processing time in seconds (millisecond resolution).
- Stop logging unusable information, e.g. private remote IPs, proxy path information.

## 0.3.0

- Allow `client_body_buffer_size` to be overridden.

## 0.2.2

- Add `--max-time` to the curl health check.

## 0.2.1

- Wait for the application to pass healthchecks before listening
  (and accepting) downstream healthchecks.

## 0.2.0

- Pass original request scheme to consuming application

## 0.1.0

- Pass original request hostname to consuming application

## 0.0.1

- Initial version
