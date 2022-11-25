#! /usr/bin/env bash
set -eu

role="$1"; shift
logname="$1"; shift
prefix=; [[ $# -gt 0 ]] && { prefix="$1"; shift; }
trillian_rpc=localhost:6962; [[ $# -gt 0 ]] && { trillian_rpc="$1"; shift; }

init_tree() {
    local args="--admin_server $trillian_rpc"
    case $role in
	secondary)
	    args+=" -tree_type PREORDERED_LOG"
	    ;;
    esac
    ~/go/bin/createtree $args > tid
}

init_keys() {
    [[ $((8#$(stat -c %a .) & 8#22)) -eq 0 ]] # Avoid race.
    [[ -f sk ]] || touch sk
    chmod 600 sk

    ~/go/bin/sigsum-debug key private | tee sk | ~/go/bin/sigsum-debug key public > vk
}

start_log() {
    [[ $# -gt 0 ]] && { local pref="$1"; shift; }
    [[ -s tid ]]
    [[ -s sk ]]
    [[ -s external-endpoint ]]
    [[ -s internal-endpoint ]]

    local cmd=
    case $role in
	primary)
	    [[ -s sth-path ]]
	    cmd+=~/go/bin/sigsum-log-primary
	    cmd+=" -sth-path $(cat sth-path)"
	    [[ -s secondary ]] && cmd+=" -secondary-url=$(head -1 secondary)"
	    [[ -s secondary ]] && cmd+=" -secondary-pubkey=$(tail -1 secondary)"
	    [[ -s witnesses ]] && cmd+=" -witnesses $(cat witnesses)"
	    [[ -s shard ]] && cmd+=" -shard-interval-start $(head -1 shard | tail -1)"
	    [[ -s max-range ]] && cmd+=" -max-range $(cat max-range)"
	    ;;
	secondary)
	    [[ -s primary ]]
	    cmd+=~/go/bin/sigsum-log-secondary
	    cmd+=" -primary-url=$(head -1 primary)"
	    cmd+=" -primary-pubkey=$(tail -1 primary)"
	    ;;
	*)
	    echo "$0: $role: invalid role"
	    exit 1
    esac

    cmd+=" -external-endpoint $(cat external-endpoint)"
    cmd+=" -internal-endpoint $(cat internal-endpoint)"
    cmd+=" -trillian-rpc-server $trillian_rpc"
    cmd+=" -tree-id $(cat tid)"
    cmd+=" -key sk"
    [[ -v pref ]] && cmd+=" -url-prefix $pref"
    [[ -s interval ]] && cmd+=" -interval $(cat interval)"

    $cmd
}

dn="$HOME/.config/sigsum/$logname"
cd "$dn" 2>/dev/null || { mkdir -pm 0700 "$dn"; cd "$dn"; }

[[ -s tid ]] || init_tree
[[ -s sk ]] || init_keys
start_log $prefix
