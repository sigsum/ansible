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
	    args+=" --tree_type PREORDERED_LOG"
	    ;;
    esac
    tree_id=$(~/go/bin/createtree $args)
    echo "tree-id=${tree_id}" > tree-id
    ~/go/bin/sigsum-mktree --mode empty --sth-file "$dn/sth"
}

start_log() {
    [[ $# -gt 0 ]] && { local pref="$1"; shift; }
    case $role in
	primary)
	    SIGSUM_LOGSERVER_CONFIG="$dn/config.toml" ~/go/bin/sigsum-log-primary
	    ;;
	secondary)
	    SIGSUM_LOGSERVER_CONFIG="$dn/config.toml" ~/go/bin/sigsum-log-secondary
	    ;;
	*)
	    echo "$0: $role: invalid role"
	    exit 1
    esac
}

dn="$HOME/.config/sigsum/$logname"
cd "$dn" 2>/dev/null || { mkdir -pm 0700 "$dn"; cd "$dn"; }

[[ -s tree-id ]] || init_tree
start_log $prefix
