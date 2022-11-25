#! /usr/bin/env bash
set -eu

signer_rpc=localhost:6961
[ $# -gt 0 ] && { signer_rpc="$1"; shift; }
signer_http=localhost:6964
[ $# -gt 0 ] && { signer_http="$1"; shift; }
server_rpc=localhost:6962
[ $# -gt 0 ] && { server_rpc="$1"; shift; }
server_http=localhost:6963
[ $# -gt 0 ] && { server_http="$1"; shift; }

~/go/bin/trillian_log_signer \
    --force_master \
    --rpc_endpoint=$signer_rpc \
    --http_endpoint=$signer_http \
    --num_sequencers 1 \
    --sequencer_interval 100ms \
    --batch_size 100 \
    --mysql_uri 'stfe:zaphod@tcp(127.0.0.1:3306)/test' &

~/go/bin/trillian_log_server \
    --rpc_endpoint=$server_rpc \
    --http_endpoint=$server_http \
    --mysql_uri 'stfe:zaphod@tcp(127.0.0.1:3306)/test' &
