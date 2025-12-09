#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Ethereum in Practice
# Description: 
# ======================================================

#### Installing and configuring the Geth client

geth

--syncmode value

#### Creating a Geth new account

geth account new

geth account list

 #### Geth console

geth console

 #### Geth attach

geth attach

eth.accounts

 #### Geth JSON RPC API

geth --http --http.api "eth,net,web3,personal"
geth --dev --http --http.api "eth,net,web3,debug,txpool,miner"

curl -X POST --insecure \
    -H "Content-Type: application/json" \
    --data '{"jsonrpc":"2.0","method":"eth_accounts","params":[], "id":64}'\
    http://localhost:8545

curl -X POST --insecure \
    -H "Content-Type: application/json" \
    --data '{"jsonrpc":"2.0","method":"net_listening","params":[], "id":64}'\ 
    http://localhost:8545

curl -X POST --insecure \
    -H "Content-Type: application/json"\
    --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[], "id":64}'\ 
    http://localhost:8545

curl -X POST --insecure \
    -H "Content-Type: application/json"\ 
    --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[], "id":64}'\ 
    http://localhost:8545

curl -X POST --insecure \
    -H "Content-Type: application/json"\ 
    --data '{"jsonrpc":"2.0","method":"eth_coinbase","params":[], "id":64}'\ 
    http://localhost:8545

