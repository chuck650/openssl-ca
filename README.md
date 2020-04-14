# openssl-ca: An OpenSSL based Certificate Authority for private networks

## Check what hosts are affected by a playbook

```bash
$ ansible-playbook playbooks/certauth.yaml --list-hosts

playbook: playbooks/certauth.yaml

  play #1 (127.0.0.1): 127.0.0.1        TAGS: []
    pattern: [u'127.0.0.1']
    hosts (1):
      127.0.0.1
```

## Build a basic two-tier Root CA

Create a Root CA with three subordinate certificate authorities: One each for issuing user certificates, host certificates, and service certificates.  Each CA uses elliptic curve (EC) keys in certificates with subject alternative name (SAN) attributes set.

```bash
$ ansible-playbook playbooks/certauth.yaml
```
