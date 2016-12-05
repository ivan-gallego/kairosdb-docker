FROM java:8-alpine

RUN apk upgrade libssl1.0 --update-cache && \
    apk add wget ca-certificates bash
RUN wget -O /tmp/kairosdb_1.1.1-1.tar.gz \
    https://github.com/kairosdb/kairosdb/releases/download/v1.1.2/kairosdb-1.1.2-1.tar.gz

RUN mkdir -p /opt/ && \
    cd /opt/ && \
    tar -xvf /tmp/kairosdb*

EXPOSE 4242 8080 2003 2004

ONBUILD ADD ./conf/kairosdb.properties /opt/kairosdb/conf/kairosdb.properties

ENTRYPOINT [ "/opt/kairosdb/bin/kairosdb.sh"]
CMD [ "run" ]

