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