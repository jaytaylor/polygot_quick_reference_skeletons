# trappend: Set or append command to trap signal handler

```bash
# trappend is like trap, with the addition  that if there is an existing trap
# already set, it will append the new command(s) without clobbering the
# pre-existing trap orders.
#
# n.b. Won't work for RETURN (hopefully this is somewhat obvious ;).
#
# usage: trappend cmds.. SIGNAL
trappend() {
    local sig
    local existing

    # n.b. Reverse-shift operation.
    sig="${*:$#}"
    set -- "${@:1:$(($#-1))}"

    if [ "${sig}" = 'RETURN' ]; then
        echo 'ERROR: trappend: SIGNAL value cannot be "RETURN"' 1>&2
        return 1
    fi

    if [ -n "$(trap -p "${sig}")" ]; then
        existing="$(trap -p "${sig}" | sed "s/^trap -- '\(.*\)' ${sig}\$/\1/");"
    fi

    # shellcheck disable=SC2064
    trap "${existing:-}$*" "${sig}"
}
```

## Example usage

```bash
trappend 'echo hello 3' EXIT
trappend 'echo hello 4' EXIT

echo hello 0
echo hello 1
```

Output:

```bash
hello 0
hello 1
hello 3
hello 4
```
