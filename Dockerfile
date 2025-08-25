FROM redis:8.2.1-bookworm

WORKDIR /redis

COPY init.sh .
COPY redis.conf .

LABEL version="8.2.1-bookworm"
LABEL org.opencontainers.image.authors="https://blog.azagra.dev"

EXPOSE 6379/tcp

RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*
RUN chmod +x init.sh
