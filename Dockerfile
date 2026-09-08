FROM ubuntu:24.04

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       bash \
       procps \
       util-linux \
       coreutils \
       gawk \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY bin/ ./bin/
COPY lib/ ./lib/
COPY config/ ./config/

RUN chmod +x ./bin/monitor.sh

ENTRYPOINT ["./bin/monitor.sh"]