# Safe for-loop for `find` output

https://stackoverflow.com/a/9612232/293064

```bash
find '.' -print0 | while IFS= read -d '' -r line; do
    echo "line=${line}"
done
```
