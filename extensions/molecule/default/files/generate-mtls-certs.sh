#!/bin/bash

#
# Generate the PEM values used in host_vars/sigsum-primary.yml.
# All output files are written to the current working directory.
#

set -euo pipefail

# Root CA: a self-signed P-256 certificate, valid for ten years
openssl genpkey \
    -algorithm EC \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -out root.key

openssl req -new -x509 -sha256 \
    -key root.key \
    -out root.crt \
    -days 3650 \
    -subj "/CN=Sigsum mTLS example root" \
    -addext "basicConstraints=critical,CA:TRUE,pathlen:0" \
    -addext "keyUsage=critical,keyCertSign"

# Leaf: a P-256 private key and a certificate signing request
openssl genpkey \
    -algorithm EC \
    -pkeyopt ec_paramgen_curve:prime256v1 \
    -out client.key

openssl req -new -sha256 \
    -key client.key \
    -out client.csr \
    -subj "/CN=Sigsum mTLS example client"

# Sign the leaf with the root using ECDSA/SHA-256, valid for ten years
cat > client.ext <<'EOF'
basicConstraints=critical,CA:FALSE
keyUsage=critical,digitalSignature
extendedKeyUsage=clientAuth
EOF

openssl x509 -req -sha256 \
    -in client.csr \
    -out client.crt \
    -CA root.crt \
    -CAkey root.key \
    -CAcreateserial \
    -days 3650 \
    -extfile client.ext

# Concatenate leaf and root to form a chain
cat client.crt root.crt > client-chain.crt

# Clean up
rm -f client.csr client.ext root.srl
