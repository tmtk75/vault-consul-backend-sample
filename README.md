# README

## Prerequisites
- vagrant
- ansible

## Getting Started
```
$ vagrant up
$ make playbook
$ make vault-init
```

To reset all
```
$ make vault-stop
$ make consul-reset
$ make vault-start
```
