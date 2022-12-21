FROM buildpack-deps:buster

RUN apt-get update && \
    apt-get install -y socat && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD scripts /scripts
RUN chmod +x /scripts/entrypoint.sh

ENTRYPOINT ["/scripts/entrypoint.sh"]

CMD socat TCP4-LISTEN:$LOCAL_PORT,reuseaddr,fork,tcpwrap=socat tcp:$REMOTE_HOST:$REMOTE_PORT & pid=$! && trap "kill $pid" INT TERM && \
    echo "Socat started listening on $LOCAL_PORT: Redirecting traffic to $REMOTE_HOST:$REMOTE_PORT ($pid). Only allowing the following IPs to connect: $ALLOWED_HOSTS" && wait $pid
