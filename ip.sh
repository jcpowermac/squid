#!/bin/bash

HOST=squid-default.apps.jcallen-pxydev-1.devcluster.openshift.com

ROOTCA=${PWD}/CA
INTERMEDIATE=${ROOTCA}/INTERMEDIATE
cd ${ROOTCA}

openssl genrsa -aes256 \
               -out ${INTERMEDIATE}/private/${HOST}.key.pem 2048

openssl req -config ${INTERMEDIATE}/openssl.cnf \
            -key ${INTERMEDIATE}/private/${HOST}.key.pem \
            -new -sha256 -out ${INTERMEDIATE}/csr/${HOST}.csr.pem

openssl ca -config ${INTERMEDIATE}/openssl.cnf \
            -extensions server_cert -days 375 -notext -md sha256 \
            -in ${INTERMEDIATE}/csr/${HOST}.csr.pem \
            -out ${INTERMEDIATE}/certs/${HOST}.cert.pem

