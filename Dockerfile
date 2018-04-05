FROM alpine:3.4

RUN apk add --no-cache lsyncd rsync \
    && mkdir -p /etc/lsyncd/conf.d/ \
                /etc/rsyncd \
                /dummy_src \
                /dummy_dest \
                /rsyncd/tmp

ADD lsyncd.conf /etc/lsyncd/
ADD rsyncd.conf /etc/rsyncd/
ADD docker-entrypoint.sh /

RUN chmod 0755 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
