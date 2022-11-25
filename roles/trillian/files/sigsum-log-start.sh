#! /usr/bin/env bash
set -eu

logname="$1"; shift

trillian_rpc=localhost:6962
[ $# -gt 0 ] && { trillian_rpc="$1"; shift; }

init_tree() {
    ~/go/bin/createtree --admin_server "$trillian_rpc" > tid
}

init_keys() {
    [ $((8#$(stat -c %a .) & 8#22)) -eq 0 ] # Avoid race.
    [ -f sk ] || touch sk
    chmod 600 sk

    ~/go/bin/sigsum-debug key private | tee sk | ~/go/bin/sigsum-debug key public > vk
}

start_log() {
    local ln="$1"; shift
    [ -s tid ]
    [ -s sk ]
    [ -s http_endpoint ]

    local cmd="$HOME/go/bin/sigsum_log_go"
    cmd+=" --logtostderr"
    cmd+=" --prefix $ln"
    cmd+=" --http_endpoint $(cat http_endpoint)"
    cmd+=" --log_rpc_server $trillian_rpc"
    cmd+=" --trillian_id $(cat tid)"
    cmd+=" --key $(cat sk)"
    [ -s witnesses ] && cmd+=" --witnesses $(cat witnesses)"
    [ -s shard ] && cmd+=" --shard_interval_start $(head -1 shard | tail -1)"
    [ -s interval ] && cmd+=" --interval $(cat interval)"

    $cmd
}

dn="$HOME/.config/sigsum/$logname"
cd "$dn" 2>/dev/null || { mkdir -pm 0700 "$dn"; cd "$dn"; }

[ -s tid ] || init_tree
[ -s sk ] || init_keys
start_log $logname
