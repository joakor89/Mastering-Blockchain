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

#### Attaching Geth to nodes

##### -> Node 1
geth attach qdata/dd1/geth.ipc

var abi =
[{"constant":true,"inputs":[],"name":"storedData","outputs":[{"name":"",
"type":"uint256"}],"payable":false,"type":"function"},{"constant":false,
"inputs":[{"name":"x","type":"uint256"}],"name":"set","outputs":[],
"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"get",
"outputs":[{"name":"retVal","type":"uint256"}],"payable":false,
"type":"function"},{"inputs":[{"name":"initVal","type":"uint256"}],
"payable":false,"type":"constructor"}];

var simpleContract = eth.contract(abi)

var simple = simpleContract.at("Add your Tx")

simple.get()

##### -> Node 2

geth attach qdata/dd2/geth.ipc

var abi =
[{"constant":true,"inputs":[],"name":"storedData","outputs":[{"name":"",
"type":"uint256"}],"payable":false,"type":"function"},{"constant":false,
"inputs":[{"name":"x","type":"uint256"}],"name":"set","outputs":[],
"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"get",
"outputs":[{"name":"retVal","type":"uint256"}],"payable":false,
"type":"function"},{"inputs":[{"name":"initVal","type":"uint256
"}],"payable":false,"type":"constructor"}];

var simpleContract = eth.contract(abi)

var simple = simpleContract.at("Add your Tx")

simple.get()

##### -> Node






