FROM redis:8.6.4-trixie

WORKDIR /redis

COPY init.sh .
COPY redis.conf .

LABEL version="redis:8.6.4-trixie"
LABEL org.opencontainers.image.authors="https://blog.azagra.dev"

EXPOSE 6379/tcp

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*
RUN chmod +x init.sh
