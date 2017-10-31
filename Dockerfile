FROM java:8-alpine

RUN apk upgrade libssl1.0 --update-cache && \
    apk add wget ca-certificates bash
RUN wget -O /tmp/kairosdb-1.1.3-1.tar.gz \
    https://github.com/kairosdb/kairosdb/releases/download/v1.1.3/kairosdb-1.1.3-1.tar.gz

RUN mkdir -p /opt/ && \
    cd /opt/ && \
    tar -xvf /tmp/kairosdb*

EXPOSE 4242 8080 2003 2004

ADD ./conf/kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

ENTRYPOINT [ "/opt/kairosdb/bin/kairosdb.sh"]
CMD [ "run" ]

