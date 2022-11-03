FROM nginx:stable

COPY docker-entrypoint.d/ /docker-entrypoint.d/
RUN chmod -c a+x /docker-entrypoint.d/*-custom_*.sh && \
    mkdir -p /etc/nginx/snippets /usr/local/etc/nginx

COPY templates/*.template /usr/local/etc/nginx/
COPY configs/cache.conf /etc/nginx/snippets/cache.conf
COPY configs/default.conf /etc/nginx/conf.d/default.conf
COPY configs/nginx.conf /etc/nginx/nginx.conf
