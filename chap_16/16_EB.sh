#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Enterprice Blockchain
# Description: 
# ======================================================


# Enterprice Blockchain

### Setting up a Quorum network with IBFT

#### Installing and running Quorum Wizard

npm -v

node –v

npm install -g quorum-wizard

quorum-wizard

cd network/4-nodes-istanbul-tessera-bash

./start.sh

#### Running a private transaction

4-nodes-istanbul-tessera-bash ./runscript.sh private_contract.js



