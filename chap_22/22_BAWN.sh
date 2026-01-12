#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Blockchain Applications and What’s Next
# Description: Iot, Governance, DeFi & so on
# ======================================================


# Blockchain Applications and What’s Next

### Setting up Raspberry Pi

uname -a

wget https://gethstore.blob.core.windows.net/builds/geth-linux- arm7-1.5.6-2a609af5.tar.gz

tar -zxvf geth-linux-arm7-1.5.6-2a609af5.tar

./geth init genesis.json

admin.nodeInfo

cat static-nodes.json

#### Setting up The 1st Node

geth --datadir .ethereum/privatenet/ --networkid 786 --maxpeers 5 --http \
    --http.api web3,eth,debug,personal,net --http.port 9001 --http.corsdomain "*" \
    --port 30301 --identity "drequinox"

#### Setting up The Raspberry Pi Node

./geth --networkid 786 --maxpeers 5 --http --http.api \ 
    web3,eth,debug,personal,net --http.port 9002 --http.corsdomain "*" --port 30302 \
    --identity "raspberry"

geth attach

geth attach ipc:.ethereum/privatenet/geth.ipc

#### Installing Node.js

curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -

sudo apt-get install nodejs

npm -v

node -v

npm install web3@0.18.0

npm install web3@0.20.2

npm install onoff --save

#### Developing & Running a Solidity Contract

###### -> Check the file up at the same folder

truffle migrate

web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:9002"));

node index.js







