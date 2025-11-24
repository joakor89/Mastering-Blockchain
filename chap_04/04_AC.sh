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

#### Generating RSA Digital Signatures

openssl dgst -sha256 message.txt

openssl dgst -sha256 -sign privatekey.pem -out signature.bin message.txt

cat signature.bin

openssl dgst -sha256 -verify publickey.pem -signature signature.bin message.txt

openssl dgst -sha256 -verify publickey.pem –signature someothersignature.bin message.txt

#### Generating ECDSA Digital Signatures

openssl ecparam -genkey -name secp256k1 -noout -out eccprivatekey.pem

cat eccprivatekey.pem

openssl ec -in eccprivatekey.pem -pubout -out eccpublickey.pem


echo testing > testsign.txt

cat testsign.txt

openssl dgst -ecdsa-with-SHA1 -sign eccprivatekey.pem testsign.txt > ecsign.bin

###### -> DEPRECATED: openssl dgst -ecdsa-with-SHA1 -verify eccpublickey.pem -signature ecsign.bin testsign.txt

openssl dgst -sha256 -sign eccprivatekey.pem -out ecsign.bin testsign.bin

openssl req -new -key eccprivatekey.pem -x509 -nodes -days 365 - out ecccertificate.pem

openssl x509 -in ecccertificate.pem -text -noout












