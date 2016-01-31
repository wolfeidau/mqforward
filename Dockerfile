FROM debian:jessie

RUN apt-get update && \
    apt-get -y --no-install-recommends install libfontconfig curl ca-certificates && \
    apt-get clean && \
    curl -L https://github.com/tianon/gosu/releases/download/1.5/gosu-amd64 > /usr/sbin/gosu && \
    chmod +x /usr/sbin/gosu && \
    apt-get remove -y curl && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

RUN groupadd -r mqforward && useradd -r -g mqforward mqforward
RUN mkdir -p /etc/mqforward

VOLUME ["/etc/mqforward"]

EXPOSE 4000

COPY ./mqforward /mqforward
COPY ./run.sh /run.sh
COPY ./mqforward.ini.example /etc/mqforward/mqforward.ini

ENTRYPOINT ["/run.sh"]
