#!/bin/bash

# ======================================================
# Author: Joaquin Romero
# Script: Assymetric Cryptography
# Demonstrates RSA key usage to encrypt and decrypt a test file using OpenSSL (pkeyutl + OAEP).
# ======================================================

#### Encrypting and Decrypting with RSA
openssl genpkey -algorithm RSA -out privatekey.pem -pkeyopt rsa_keygen_bits:1024

cat privatekey.pem

openssl pkey -in privatekey.pem -pubout -out publickey.pem

ls -lh publickey.pem

cat publickey.pem

echo datatoencrypt > message.txt

openssl pkeyutl -encrypt -pubin -inkey publickey.pem -in message.txt -out message.rsa

openssl pkeyutl -decrypt -inkey privatekey.pem -in message.rsa -out message.dec

cat message.dec

#### The Discrete Logarithm Problem

openssl ecparam -param_enc explicit -text -noout -name secp256k1

##### Generating keys with ECC

openssl ecparam -list_curves

openssl ecparam -name secp256k1 -genkey -noout -out ec-privatekey.pem

cat ec-privatekey.pem

openssl ec -in ec-privatekey.pem -pubout -out ec-pubkey.pem

cat ec-pubkey.pem

openssl ec -in ec-privatekey.pem -text -noout

openssl ec -in ec-pubkey.pem -pubin - text -noout

openssl ecparam -name secp256k1 -out secp256k1.pem

cat secp256k1.pem

























