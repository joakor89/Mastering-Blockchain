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

##############################################################
# ECDSA OPERATIONS — MODERN OPENSSL 3.x WORKFLOW
# Curve: secp256k1 (used in Bitcoin & Ethereum)
##############################################################

# 1. Generate an EC private key using the secp256k1 elliptic curve
openssl ecparam -genkey -name secp256k1 -noout -out eccprivatekey.pem

# 2. Display the generated private key (optional — for inspection only)
cat eccprivatekey.pem

# 3. Derive the corresponding EC public key from the private key
openssl ec -in eccprivatekey.pem -pubout -out eccpublickey.pem

# 4. Create a test message to sign
echo "testing" > testsign.txt
cat testsign.txt

# 5. Sign the message using ECDSA with SHA-256 (modern and secure)
# NOTE: The old option "-ecdsa-with-SHA1" is deprecated in OpenSSL 3.x.
openssl dgst -sha256 -sign eccprivatekey.pem -out ecsign.bin testsign.txt

# 6. Verify the ECDSA signature using the EC public key
openssl dgst -sha256 -verify eccpublickey.pem -signature ecsign.bin testsign.txt

# 7. Generate a self-signed X.509 certificate using the EC private key
# This is commonly used for TLS experiments and PKI fundamentals.
openssl req -new -key eccprivatekey.pem -x509 -nodes -days 365 -out ecccertificate.pem

# 8. Display the contents of the generated certificate
openssl x509 -in ecccertificate.pem -text -noout












