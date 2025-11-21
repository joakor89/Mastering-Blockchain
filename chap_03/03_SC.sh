#!/bin/bash

# ======================================================
# Author: Joaquin Romero
# Script: AES Encryption Demo
# Description: Encrypts and decrypts a test file using AES-256.
# ======================================================

#### Generating Random Strings

openssl rand -hex 16

openssl help

#### Encrypting messages with SHA-256

echo -n 'Hello' | openssl dgst -sha256

echo -n 'hello' | openssl dgst -sha256

### Advanced Encryption Standard

#### Encrypting and Decrypting using AES

echo Datatoencrypt > message.txt

openssl enc -aes-256-cbc -in message.txt -out message.bin

openssl enc -base64 -in message.bin -out message.b64

cat message.b64

openssl enc -d -aes-256-cbc -in message.bin -out message.dec


