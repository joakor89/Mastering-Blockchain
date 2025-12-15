import Web3 from "web3";
const Web3 = require("web3");

var Web3 = require("web3");

// Detect provider (MetaMask / injected)
if (typeof web3 !== "undefined") {
    web3 = new Web3(web3.currentProvider);
} else {
    // Fallback to local node
    web3 = new Web3(
        new Web3.providers.HttpProvider("http://localhost:8001")
    );
}

// Set default account
web3.eth.defaultAccount = web3.eth.accounts[0];

// Contract ABI
var SimpleContract = web3.eth.contract([
    {
        "constant": false,
        "inputs": [
            {
                "name": "x",
                "type": "uint8"
            }
        ],
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
                "indexed": false,
                "name": "returnValue",
                "type": "bool"
            }
        ],
        "name": "valueEvent",
        "type": "event"
    }
]);

// Contract instance
var simplecontract = SimpleContract.at(
    "0x3b52828c63ffdcb27fa5105bc66b8f1cb1bc648c"
);

console.log(simplecontract);

// Call Matcher with true condition
function callMatcherTrue() {
    var txn = simplecontract.Matcher.call(12);
    console.log("return value: " + txn);
}

// Call Matcher with false condition
function callMatcherFalse() {
    var txn = simplecontract.Matcher.call(1);
    console.log("return value: " + txn);
}

// Call Matcher with user input
function myFunction() {
    var x