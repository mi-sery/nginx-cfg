#!/bin/bash
############# CA certificate ####################### 
openssl genrsa -out ca1.key 2048
openssl req -new -key ca1.key -out ca1.csr \
  -subj "/C=GB/L=China/O=primihub/CN=chainmaker-1"
openssl req -new -x509 -days 3650 -key ca1.key -out ca1.crt \
   -subj "/C=GB/L=China/O=primihub/CN=chainmaker-1"


############server side certificate #################
openssl genrsa -out server1.key 2048

openssl req -new -key server1.key -out server1.csr \
  -subj "/C=GB/L=China/O=primihub/CN=chainmaker_server1"

openssl x509 -req -days 3650 \
   -in server1.csr -out server1.crt \
   -CA ca1.crt -CAkey ca1.key -CAcreateserial
