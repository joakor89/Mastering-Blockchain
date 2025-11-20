#!/bin/bash

# ======================================================
# Author: Joaquin Romero
# Script: AES Encryption Demo
# Description: Encrypts and decrypts a test file using AES-256.
# ======================================================

#### Generating random strings

openssl rand -hex 16

openssl help

#### Encrypting messages with SHA-256

echo -n 'Hello' | openssl dgst -sha256

echo -n 'hello' | openssl dgst -sha256


