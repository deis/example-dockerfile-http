# Trivial Dockerfile Quick Start Guide

This guide will walk you through deploying a trivial
[Dockerfile](https://docs.docker.com/reference/builder/) HTTP application
on [Deis](https://github.com/deis/deis).

## Usage

```console
$ git clone https://github.com/deis/example-dockerfile-http.git
$ cd example-dockerfile-http
$ deis create
Creating Application... done, created upbeat-dragster
Git remote deis added
remote available at ssh://git@deis.local3.deisapp.com:2222/upbeat-dragster.git
$ git push deis master
Counting objects: 63, done.
Delta compression using up to 4 threads.
Compressing objects: 100% (53/53), done.
Writing objects: 100% (63/63), 8.53 KiB | 0 bytes/s, done.
Total 63 (delta 20), reused 0 (delta 0)

-----> Building Docker image
remote: Sending build context to Docker daemon 14.34 kB
Step 0 : FROM alpine:3.4
3.4: Pulling from library/alpine
3571dd565f47: Pulling fs layer
3571dd565f47: Verifying Checksum
3571dd565f47: Download complete
3571dd565f47: Pull complete
Digest: sha256:2d4f890b7eddb390285e3afea9be98a078c2acd2fb311da8c9048e3d1e4864d3
Status: Downloaded newer image for alpine:3.4
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
(7/8) Installing pcre (8.38-r0)
(8/8) Installing nginx (1.8.1-r0)
Executing busybox-1.24.1-r7.trigger
OK: 14 MiB in 19 packages
 ---> 9434dd06a084
Removing intermediate container 6cdd54978d8c
Step 2 : RUN ln -sf /dev/stdout /var/log/nginx/access.log
 ---> Running in 38f14358233d
 ---> 4ffef06ba6a0
Removing intermediate container 38f14358233d
Step 3 : RUN ln -sf /dev/stderr /var/log/nginx/error.log
 ---> Running in 60f4ae7f4756
 ---> 050b810046b9
Removing intermediate container 60f4ae7f4756
Step 4 : ENV POWERED_BY Deis
 ---> Running in c9fc78347b02
 ---> 47af3c178d1d
Removing intermediate container c9fc78347b02
Step 5 : COPY rootfs /
 ---> 4ac01469f15c
Removing intermediate container fe62caa50306
Step 6 : CMD /bin/boot
 ---> Running in 741d73e3b20f
 ---> ca9f2bdb5683
Removing intermediate container 741d73e3b20f
Step 7 : EXPOSE 80
 ---> Running in 0e14c04fa674
 ---> e4739432f005
Removing intermediate container 0e14c04fa674
Step 8 : ENV GIT_SHA 7ae43cc95305a4a208ff9a4950872f1bbe86a3f8
 ---> Running in 69ab5944413c
 ---> e36e1c6e0a89
Removing intermediate container 69ab5944413c
Successfully built e36e1c6e0a89
-----> Pushing image to private registry

-----> Launching...
       done, upbeat-dragster:v2 deployed to Deis

       http://upbeat-dragster.local3.deisapp.com

       To learn more, use `deis help` or visit http://deis.io

To ssh://git@deis.local3.deisapp.com:2222/upbeat-dragster.git
 * [new branch]      master -> master
$ curl http://upbeat-dragster.local3.deisapp.com
Powered by Deis
$ deis config:set POWERED_BY="Engine Yard"
Creating config... done, v3

=== upbeat-dragster Config
POWERED_BY      Engine Yard
$ curl http://upbeat-dragster.local3.deisapp.com
Powered by Engine Yard
```

## Additional Resources

* [Get Deis](http://deis.io/get-deis/)
* [GitHub Project](https://github.com/deis/deis)
* [Documentation](http://docs.deis.io/)
* [Blog](http://deis.io/blog/)
