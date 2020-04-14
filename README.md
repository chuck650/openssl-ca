# Task based reference guide

## Check what hosts are affected by a playbook

```
$ ansible-playbook certauth.yaml --list-hosts

playbook: certauth.yaml

  play #1 (127.0.0.1): 127.0.0.1        TAGS: []
    pattern: [u'127.0.0.1']
    hosts (1):
      127.0.0.1
```
