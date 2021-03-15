FROM quorumengineering/quorum:21.1.0

WORKDIR /qdata/dd

COPY ./datadir/genesis.json genesis.json
COPY ./datadir/nodekey nodekey
COPY ./datadir/static-nodes.json static-nodes.json

COPY ./start.sh /start.sh

EXPOSE 8545 8546 8547 30303 30303/udp 50400

ENTRYPOINT ["/start.sh"]
