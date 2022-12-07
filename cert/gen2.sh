#!/bin/bash
############# CA certificate ####################### 
openssl genrsa -out ca2.key 2048
openssl req -new -key ca2.key -out ca2.csr \
  -subj "/C=GB/L=China/O=primihub/CN=chainmaker-2"
openssl req -new -x509 -days 3650 -key ca2.key -out ca2.crt \
   -subj "/C=GB/L=China/O=primihub/CN=chainmaker-2"


############server side certificate #################
openssl genrsa -out server2.key 2048

openssl req -new -key server2.key -out server2.csr \
  -subj "/C=GB/L=China/O=primihub/CN=chainmaker_server2"

openssl x509 -req -days 3650 \
   -in server2.csr -out server2.crt \
   -CA ca2.crt -CAkey ca2.key -CAcreateserial
