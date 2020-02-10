#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

if [ "${1:-}" = '-v' ]; then
    echo 'DEBUG: verbose mode enabled' 1>&2
    set -o xtrace
    shift
fi

die() {
    echo "ERROR: $*" 1>&2
    exit 1
}
export -f die

usage() {
    echo "usage: $0 [-v?] ..."
}

main() {
    if [[ "${1:-}" =~ ^(-h|--help)$ ]]; then
        usage
        return 0
    fi
}

if [ "${BASH_SOURCE[0]}" = "${0}" ] || [ "${BASH_SOURCE[0]}" = '--' ]; then
    main "$@"
fi
