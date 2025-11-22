#!/bin/bash

# ======================================================
# Author: Joaquin Romero
# Script: Assymetric Cryptography
# Description: Encrypts and decrypts a test file using AES-256.
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









