# Trivial Dockerfile Quick Start Guide

This guide will walk you through deploying a trivial
[Dockerfile](https://docs.docker.com/reference/builder/) HTTP application
on [Deis](https://github.com/deis/deis).

## Usage

```console
$ git clone https://github.com/deis/example-dockerfile-http.git
$ cd example-dockerfile-http
$ deis create
Creating application... done, created zipped-doghouse
Git remote deis added
$ git push deis master
Counting objects: 24, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (24/24), done.
Writing objects: 100% (24/24), 3.01 KiB | 0 bytes/s, done.
Total 24 (delta 5), reused 0 (delta 0)

-----> Building Docker image
remote: build context to Docker daemon 3.072 kB
Step 0 : FROM alpine:3.1
Pulling repository alpine
b3dbab3810fc: Pulling image (3.1) from alpine
...
Status: Downloaded newer image for alpine:3.1
 ---> b3dbab3810fc
Step 1 : RUN apk add -U bash socat && rm -rf /var/cache/apk*
 ---> Running in 679e2985f6a6
fetch http://dl-4.alpinelinux.org/alpine/v3.1/main/x86_64/APKINDEX.tar.gz
(1/5) Installing ncurses-terminfo-base (5.9-r3)
(2/5) Installing ncurses-libs (5.9-r3)
(3/5) Installing readline (6.3-r3)
(4/5) Installing bash (4.3.30-r0)
(5/5) Installing socat (1.7.3.0-r0)
Executing busybox-1.22.1-r14.trigger
OK: 7 MiB in 20 packages
 ---> 97dabf10bf4a
Removing intermediate container 679e2985f6a6
Step 2 : ENV POWERED_BY Deis
 ---> Running in d85ec8dfb01a
 ---> 5c24a17d2aa7
Removing intermediate container d85ec8dfb01a
Step 3 : CMD socat TCP4-LISTEN:1500,fork EXEC:"echo HTTP/1.1 200 OK\n\nPowered by $POWERED_BY"
 ---> Running in 8a6098293e0a
 ---> 690d7f328473
Removing intermediate container 8a6098293e0a
Step 4 : EXPOSE 1500
 ---> Running in a62cbc2a9bd2
 ---> 494c983c25fb
Removing intermediate container a62cbc2a9bd2
Step 5 : ENV GIT_SHA 9598de4114fbabdde9f5a1ec740d085401ac90f3
 ---> Running in 22739f6b44c5
 ---> db7c322a9367
Removing intermediate container 22739f6b44c5
Successfully built db7c322a9367
-----> Pushing image to private registry

-----> Launching...
       done, zipped-doghouse:v2 deployed to Deis

       http://zipped-doghouse.local3.deisapp.com

       To learn more, use `deis help` or visit http://deis.io

To ssh://git@deis.local3.deisapp.com:2222/zipped-doghouse.git
 * [new branch]      master -> master
$ curl http://zipped-doghouse.local3.deisapp.com
Powered by Deis
$ deis config:set POWERED_BY="Engine Yard"
$ curl http://zipped-doghouse.local3.deisapp.com
Powered by Engine Yard
```

## Additional Resources

* [Get Deis](http://deis.io/get-deis/)
* [GitHub Project](https://github.com/deis/deis)
* [Documentation](http://docs.deis.io/)
* [Blog](http://deis.io/blog/)
