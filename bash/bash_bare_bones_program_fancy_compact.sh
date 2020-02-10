#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

ts() { date -u +'%Y-%m-%dT%H:%M:%S%z'; }
log_debug() { echo "$(ts) DEBUG: $*" 1>&2; }
log_info() { echo "$(ts) INFO: $*" 1>&2; }
log_warn() { echo "$(ts) WARN: $*" 1>&2; }
log_error() { echo "$(ts) ERROR: $*" 1>&2; }
die() { log_error "$*"; exit 1; }

export -f ts
export -f log_debug
export -f log_info
export -f log_warn
export -f log_error
export -f die

if [ "${1:-}" = '-v' ]; then
    log_debug 'verbose mode enabled'
    set -o xtrace
    shift
fi

usage() { echo "usage: $0 [-v?] ..."; }

main() {
    if [[ "${1:-}" =~ ^(-h|--help)$ ]]; then
        usage
        return 0
    fi
}

if [ "${BASH_SOURCE[0]}" = "${0}" ] || [ "${BASH_SOURCE[0]}" = '--' ]; then
    main "$@"
fi
