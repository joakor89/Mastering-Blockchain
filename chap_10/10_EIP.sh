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

#### Connecting to test networks

geth --sepolia

#### Starting up the private network

mkdir ~/etherprivate

geth --datadir ~/etherprivate init ~/etherprivate/privategenesis.json

ls -l ~/etherprivate/privategenesis.json

geth --datadir ~/etherprivate account new

geth --datadir ~/etherprivate \
  --networkid 786 \
  --http \
  --http.addr 127.0.0.1 \
  --http.port 8545 \
  --http.api "web3,eth,net,debug,txpool,miner" \
  --http.corsdomain "*"

rm -rf ~/etherprivate/geth

nano ~/etherprivate/privategenesis.json

{
  "config": {
    "chainId": 786,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "muirGlacierBlock": 0,
    "berlinBlock": 0,
    "londonBlock": 0,
    "arrowGlacierBlock": 0,
    "grayGlacierBlock": 0,
    "terminalTotalDifficulty": 0,
    "clique": {
      "period": 5,
      "epoch": 30000
    }
  },
  "nonce": "0x0",
  "timestamp": "0x0",
  "extraData": "0x", 
  "gasLimit": "0x8000000",
  "difficulty": "0x1",
  "mixHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {},
  "number": "0x0",
  "gasUsed": "0x0",
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000"
}

#### Experimenting with the Geth JavaScript console

net

eth.getBalance(eth.coinbase)

web3.fromWei(eth.getBalance(eth.coinbase), "ether")

eth.gasPrice

eth.blockNumber

debug.getBlockRlp(0)

#### Mining and sending transactions

miner.start(2)

miner.stop()

personal.newAccount("Password123")

personal.unlockAccount("...")

geth --datadir ~/etherprivate/ --allow-insecure-unlock \
    --networkid 786 --http \
    --http.api 'web3,eth,net,debug,personal' --http.corsdomain '*'

personal.listAccounts

personal.unlockAccount("...")

personal.unlockAccount("...")

web3.fromWei(eth.getBalance("..."), "ether")

web3.fromWei(eth.getBalance(eth.coinbase), "ether")

web3.fromWei(eth.getBalance("..."), "ether")

eth.sendTransaction({ from: "0x6e94bdb15141491bc3b9de3a9cab9d87ae2af82f", to: "0x0f044cb4a0f924b6cfcf07c6c57945a0af75ec5b", value: 100 })

eth.sendTransaction({ from: "0x6e94bdb15141491bc3b9de3a9cab9d87ae2af82f", to: "0x0f044cb4a0f924b6cfcf07c6c57945a0af75ec5b", value: web3.toWei(100, "ether") })

miner.start()

web3.fromWei(eth.getBalance("..."), "ether")

eth.sendTransaction({from: personal.listAccounts[0], to: personal.listAccounts[1], value: 100})

eth.getTransaction("...")

#### Introducing Remix IDE
































