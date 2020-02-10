# Bash main()

Bash equivalent to `if __name__ == '__main__':` in Python.

n.b. The `'--'` part needs to be revisited.  Yesterday (Sunday 2020-02-09) I was unable to reproduce the behavior previously observed in Kubernetes a few weeks ago.

```bash
if [ "${BASH_SOURCE[0]}" = "${0}" ] || [ "${BASH_SOURCE[0]}" = '--' ]; then
    main "$@"
fi
```
