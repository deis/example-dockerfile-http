Dockerfile Quick Start Guide
============================

Here's how to deploy a trivial Dockerfile-based application on Deis.

Usage
-----

```console
$ git clone https://github.com/deis/example-dockerfile-http.git
$ cd example-dockerfile-http
$ deis create
$ deis config:set POWERED_BY="the Deis team"
$ git push deis master
```
