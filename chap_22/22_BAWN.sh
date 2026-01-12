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
