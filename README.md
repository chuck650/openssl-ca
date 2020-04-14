# An OpenSSL based Certificate Authority for private networks

The certificate authority (CA) is a private root CA using a self-signed certificate suitable for creating a certificate hierarchy on private networks where the administrator has control of the trust stores on all clients.  It was designed primarily for use in an educational environment for students to learn about certificates, certificate authorities, and the chain-of-trust trust model.

The project leverages Ansible as a DevOps tool to generate openssh config files for the installed environment, and builds the CA hierarchy on the localhost and user home directory where the user clones the project.  The Ansible playbooks only support a Linux environment.

## Suggested installation procedure.

There are a couple of dependencies for running the project.

```bash
$ sudo apt install ansible python3-distutils
```

Create a directory for `ansible` projects then clone this repository into the `ansible` directory.


```bash
~$ mkdir ~/ansible
~$ cd ~/ansible
~/ansible$ git clone https://github.com/chuck650/openssl-ca.git
~/ansible$ cd openssl-ca
~/ansible/openssl-ca$
```

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

The path for the create CA hierarchy files is `~/openssl/CertAuth/ca.${USER}.lab/`

```bash
$ ansible-playbook playbooks/certauth.yaml
```
