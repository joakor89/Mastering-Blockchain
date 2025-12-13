#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Web3 Dev using Ethereum.
# Description: Exploring the Web3 API
# ======================================================

#### Interacting with contracts using Web3 and Geth
##### ---> Snippets Updated

geth --dev \
     --http \
     --http.api "eth,net,web3,debug,txpool" \
     --http.port 8001

geth attach http://127.0.0.1:8001

web3.version

#### 
















































