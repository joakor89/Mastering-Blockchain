#!/bin/bash

# ======================================================
# Author: Joaquin Lugo
# Script: Web3 Dev using Ethereum.
# Description: Exploring the Web3 API
# ======================================================

#### Interacting with contracts using Web3 and Geth

# ----------------- Smart Contract ---------------------
# ------------------------------------------------------

##### ---> Snippets Updated

geth --dev \
     --http \
     --http.api "eth,net,web3,debug,txpool" \
     --http.port 8001

geth attach http://127.0.0.1:8001

web3.version

#### Deploying contracts

geth --datadir ~/etherprivate \
    --networkid 786 --allow-insecure-unlock \
    --http--http.api "web3,net,eth,debug,personal" \
    --http.port 8001 --http.corsdomain https://remix.ethereum.org

geth --datadir ~/etherprivate \
    --networkid 786 --allow-insecure-unlock \
    --http--http.api "web3,net,eth,debug,personal" \
    --http.port 8001 --http.corsdomain http://localhost:7777

geth --datadir ~/etherprivate \
    --networkid 786 \
    --http --http.api "web3,net,eth,debug" \
    --http.port 8001 --http.corsdomain "*"

geth attach ~/etherprivate/geth.ipc

personal.listAccounts[0]

personal.unlockAccount(personal.listAccounts[0])

web3.personal.unlockAccount("0xc9bf76271b9e42e4bf7e1888e0f52351bdb65811", "Password123", 0);

#### 

miner.start()

var valuecheckerContract = web3.eth.contract([{"constant": false,
    "inputs": [{"name": "x","type": "uint8"}],"name": "Matcher","outputs":
    [{"name": "","type": "bool"}],"payable": false,"stateMutability":
    "nonpayable","type": "function"},{"anonymous": false,"inputs":
    [{"indexed": false,"name": "returnValue","type": "bool"}],"name":
    "valueEvent","type": "event"}]);

#### Using solc to generate ABI and code

solc --abi valuechecker.sol

solc --bin valuechecker.sol


# ----------------- Smart Contract ---------------------

# ------------------------------------------------------

#### Querying contracts with Geth

eth.getBalance(valuechecker.address)

valuechecker.transactionHash

valuechecker.abi

#### Interacting with Geth using POST requests

curl -X POST -H "Content-Type: application/json" \
    --data '{"jsonrpc":"2.0","method":"personal_listAccounts","params":[],"id":67}'
    http://localhost:8001

#### Installing the web3.js JavaScript library

npm install web3

#### Creating a web3 object

# ------------------- Web3 Object ----------------------

if (typeof web3 !== 'undefined')
{
web3 = new Web3(web3.currentProvider);
}
else
{
web3 = new Web3(new Web3.providers.HttpProvider("http://localhost: 8545"));
}

# ------------------------------------------------------

#### Creating an app.js JavaScript file

# ------------- app.js JavaScript file -----------------

var Web3 = require('web3');
if (typeof web3 !== 'undefined') {
    web3 = new Web3(web3.currentProvider);
    } else {
        // set the provider you want from Web3.providers
        web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8001"));
        }
        web3.eth.defaultAccount = web3.eth.accounts[0];
        var SimpleContract = web3.eth.contract([
            {
                "constant": false,
                "inputs": [
                    {
                        "name": "x",
                        "type": "uint8"
                        }],
                        "name": "Matcher",
                        "outputs": [
                            {
                                "name": "",
                                "type": "bool"
                                }
                                ],
                                "payable": false,
                                "stateMutability": "nonpayable",
                                "type": "function"
                                },
                                {
                                    "anonymous": false,
                                    "inputs": [
                                {
                                    ter 12 385
                                    "indexed": false,
                                    "name": "returnValue",
                                    "type": "bool"
                                }
                                ],
                                "name": "valueEvent",
                                "type": "event"
                                }
                                ]);
                                var simplecontract = SimpleContract.
                                at("0x3b52828c63ffdcb27fa5105bc66b8f1cb1bc648c");
                                console.log(simplecontract);
                                function callMatchertrue()
                                var txn = simplecontract.Matcher.call(12);
                                console.log("return value: " + txn);
                                function callMatcherfalse()
                                var txn = simplecontract.Matcher.call(1);{
                                console.log("return value: " + txn);
                                function myFunction()
                                {
                                    {

                                    };
                                    }
                                    {

                                    };
                                    }
                                    {
                                        var x = document.getElementById("txtValue").value;
                                        var txn = simplecontract.Matcher.call(x);{

                                        };
                                        console.log("return value: " + txn);
                                        document.getElementById("decision").innerHTML = txn;
                                    }
# ------------------------------------------------------

#### 





































