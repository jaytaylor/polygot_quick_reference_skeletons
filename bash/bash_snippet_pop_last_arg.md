# Bash pop last argument / reverse_shift

This can also be thought of as a reverse of the `shift` command.

Works for both scripts and functions.

Credit: [Source](https://stackoverflow.com/a/26163980/293064)

```bash
last="${@:$#}"

set -- "${@:1:$(($#-1))}"
```
