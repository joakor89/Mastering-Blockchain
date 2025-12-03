#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Bitcoin in Practice
# Description: On source code setup and how to set up Bitcoin clients for various networks
#               command-line options available in Bitcoin clients. Bitcoin APIs available for
#               programming and the main points to keep in mind while evaluating APIs usage.
# ======================================================


#### Setting up a Bitcoin Node

git clone https://github.com/bitcoin/bitcoin.git

cd bitcoin

./autogen.sh
./configure.sh
make
sudo make install

#### Starting up a node in the testnet

bitcoind --testnet -daemon

bitcoin-cli --testnet <command>

bitcoin-qt –testnet

bitcoind --testnet -daemon

bitcoin-cli --testnet getmininginfo

bitcoin-cli --testnet help

bitcoin-cli --testnet stop

#### Starting up a node in regtest

bitcoind -regtest -daemon

bitcoin-cli -regtest getbalance

bitcoin-cli -regtest generatetoaddress 200 $(bitcoin-cli -regtest getnewaddress)

bitcoin-cli -regtest getbalance

bitcoin-cli -regtest getmininginfo

bitcoin-cli -regtest getblockchaininfo

bitcoin-cli -regtest stop

#### Experimenting further with bitcoin-cli

bitcoin-cli -regtest getnewaddress

bitcoin-cli -regtest sendtoaddress b1546b6ebe7c2fcf37c9f8c34fbae2a72a6f0dd817b305e0b72bfd18729c6452 20.00

bitcoin-cli -regtest generatetoaddress 7 $(bitcoin-cli -regtest getnewaddress)

#### Using the Bitcoin command-line Tool

bitcoin-cli getblock 

#### Using the JSON-RPC interface

cat bitcoin.conf

curl --user test1:testpassword \
  --data-binary '{"jsonrpc":"1.0","id":"rawtx","method":"getrawtransaction","params":["b1546b6ebe7c2fcf37c9f8c34fbae2a72a6f0dd817b305e0b72bfd18729c6452", true]}' \
  -H 'content-type: text/plain;' \
  http://127.0.0.1:18443/

#### Using the HTTP REST interface

curl http://127.0.0.1:18443/rest/block/4cfefb45cd6d0a62e35fe0f3c17abb5a64a1f50cbed276bdee3fbd771f701afe.json

