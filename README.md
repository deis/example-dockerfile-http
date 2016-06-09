# Trivial Dockerfile Quick Start Guide

This guide will walk you through deploying a trivial
[Dockerfile](https://docs.docker.com/reference/builder/) HTTP application
on [Deis Workflow][].

## Usage

```console
$ git clone https://github.com/deis/example-dockerfile-http.git
$ cd example-dockerfile-http
$ deis create
Creating Application... done, created nimbus-electron
Git remote deis added
remote available at ssh://git@deis-builder.deis.rocks:2222/nimbus-electron.git
$ git push deis master
Counting objects: 64, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (53/53), done.
Writing objects: 100% (63/63), 8.53 KiB | 0 bytes/s, done.
Total 63 (delta 20), reused 0 (delta 0)

-----> Building Docker image
remote: Sending build context to Docker daemon 14.34 kB
Step 0 : FROM alpine:3.3
3.3: Pulling from library/alpine
3571dd565f47: Pulling fs layer
3571dd565f47: Verifying Checksum
3571dd565f47: Download complete
3571dd565f47: Pull complete
Digest: sha256:2d4f890b7eddb390285e3afea9be98a078c2acd2fb311da8c9048e3d1e4864d3
Status: Downloaded newer image for alpine:3.3
 ---> 3571dd565f47
Step 1 : RUN apk add -U 	bash 	nginx 	&& rm -rf /var/cache/apk*
 ---> Running in 6cdd54978d8c
fetch http://dl-4.alpinelinux.org/alpine/v3.3/main/x86_64/APKINDEX.tar.gz
fetch http://dl-4.alpinelinux.org/alpine/v3.3/community/x86_64/APKINDEX.tar.gz
(1/8) Installing ncurses-terminfo-base (6.0-r6)
(2/8) Installing ncurses-terminfo (6.0-r6)
(3/8) Installing ncurses-libs (6.0-r6)
(4/8) Installing readline (6.3.008-r4)
(5/8) Installing bash (4.3.42-r3)
Executing bash-4.3.42-r3.post-install
(6/8) Installing nginx-initscripts (1.8.0-r0)
Executing nginx-initscripts-1.8.0-r0.pre-install
(7/8) Installing pcre (8.38-r1)
(8/8) Installing nginx (1.8.1-r0)
Executing busybox-1.24.1-r7.trigger
OK: 14 MiB in 19 packages
---> b56a0595c44d
Removing intermediate container b96da2893372
Step 3 : RUN ln -sf /dev/stdout /var/log/nginx/access.log
---> Running in 569e8626cceb
---> 4da31bb5fa5a
Removing intermediate container 569e8626cceb
Step 4 : RUN ln -sf /dev/stderr /var/log/nginx/error.log
---> Running in 206f928f8826
---> e08b8388af37
Removing intermediate container 206f928f8826
Step 5 : RUN echo двенадцать фактор для жизни
---> Running in 0ce0cdb93a9f
двенадцать фактор для жизни
---> a5c98927c99d
Removing intermediate container 0ce0cdb93a9f
Step 6 : ENV POWERED_BY Deis
---> Running in 5b1ccf6cd05e
---> d8366e89f689
Removing intermediate container 5b1ccf6cd05e
Step 7 : COPY rootfs /
---> 81318cef722d
Removing intermediate container 1d45f43721f0
Step 8 : CMD /bin/boot
---> Running in a11cd06c1ffb
---> 7e836b539eb3
Removing intermediate container a11cd06c1ffb
Step 9 : EXPOSE 80
---> Running in 7b45e0a8080a
---> 4d982af34477
Removing intermediate container 7b45e0a8080a
Successfully built 4d982af34477
Pushing to registry
Build complete.
Launching App...
Done, nimbus-electron:v2 deployed to Deis

Use 'deis open' to view this application in your browser

To learn more, use 'deis help' or visit https://deis.com/

To ssh://git@deis-builder.deis.rocks:2222/nimbus-electron.git
 * [new branch]      master -> master
$ curl http://nimbus-electron.deis.rocks
Powered by Deis
 ```

## Additional Resources

* [GitHub Project](https://github.com/deis/workflow)
* [Documentation](https://deis.com/docs/workflow/)
* [Blog](https://deis.com/blog/)

[Deis Workflow]: https://github.com/deis/workflow#readme
