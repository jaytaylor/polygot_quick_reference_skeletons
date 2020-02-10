#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

ts() {
    date -u +'%Y-%m-%dT%H:%M:%S%z'
}

log_debug() {
    echo "$(ts) DEBUG: $*" 1>&2
}

log_info() {
    echo "$(ts) INFO: $*" 1>&2
}

log_warn() {
    echo "$(ts) WARN: $*" 1>&2
}

log_error() {
    echo "$(ts) ERROR: $*" 1>&2
}

die() {
    log_error "$*"
    exit 1
}

export -f ts
export -f log_debug
export -f log_info
export -f log_warn
export -f log_error
export -f die

# n.b. alternate one-liner hack form:
# eval $(for x in info warn error; do echo -e "log_${x}() { echo \"\$(ts) $(echo ${x} | tr [:lower:] [:upper:]): yoo \$*\"; };"; done)

if [ "${1:-}" = '-v' ]; then
    log_debug 'verbose mode enabled'
    set -o xtrace
    shift
fi

usage() {
    echo "usage: $0 [-v?] ..."
}

main() {
    if [[ "${1:-}" =~ ^(-h|--help)$ ]]; then
        usage
        return 0
    fi
}

# TODO: Revisit this, behavior seems different from what I observed on
#       Kubernetes last week.  Currently not working properly.
## n.b. Checking for '--' will activate main in cases where the script body has
##      been passed in as a string argument.
##
## Example:
##     bash -c 'echo "args=\"$@\" BASH_SOURCE[0]=\""${BASH_SOURCE}"\""' -- -v

if [ "${BASH_SOURCE[0]}" = "${0}" ] || [ "${BASH_SOURCE[0]}" = '--' ]; then
    main "$@"
fi
