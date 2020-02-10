# Bash verbose xtrace mode

```bash
if [ "${1:-}" = '-v' ]; then
    echo 'DEBUG: verbose mode enabled' 1>&2
    set -o xtrace
    # n.b. trap is probably pointless here.  Use at your own discretion.
    trap 'set +o xtrace' EXIT
    shift
fi
```
