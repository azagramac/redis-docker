FROM redis:7.2.3-alpine3.18

WORKDIR /redis

COPY init.sh ./
COPY redis.conf ./

LABEL version="7.2.3"
LABEL org.opencontainers.image.authors="https://azagramac.gitbook.io/"

EXPOSE 6379/tcp

RUN chmod +x init.sh

ENTRYPOINT ["redis-server", "/redis/redis.conf", "--loglevel", "verbose"]