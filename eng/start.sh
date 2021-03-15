#!/bin/sh

if ! test -f /qdata/dd/initialized; then
    echo "Quorum initializing..."
    geth --datadir=/qdata/dd init /qdata/dd/genesis.json

    touch /qdata/dd/initialized
else
    echo "Quorum already initialized, skipping..."
fi

export PRIVATE_CONFIG=ignore
export QUORUM_CONSENSUS=raft

geth --datadir /qdata/dd --nodiscover --verbosity 6 --raft --raftport 50400 --rpc --rpcaddr 0.0.0.0 --rpcvhosts=* --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum,raft --emitcheckpoints --port 30303 --allow-insecure-unlock
