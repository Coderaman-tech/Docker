coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS      NAMES
2912e073cda5   redis     "docker-entrypoint.s…"   54 seconds ago   Up 52 seconds   6379/tcp   frosty_curran
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS      NAMES
c9b8da7c85a9   redis     "docker-entrypoint.s…"   22 seconds ago   Up 21 seconds   6379/tcp   vigilant_murdock
coderaman_tech@coderaman:~$ docker stop c9b8da7c85a9
c9b8da7c85a9
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
coderaman_tech@coderaman:~$ docker start c9b8da7c85a9
c9b8da7c85a9
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS          PORTS      NAMES
c9b8da7c85a9   redis     "docker-entrypoint.s…"   2 minutes ago   Up 25 seconds   6379/tcp   vigilant_murdock
coderaman_tech@coderaman:~$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS                     PORTS      NAMES
c9b8da7c85a9   redis     "docker-entrypoint.s…"   3 minutes ago   Up 49 seconds              6379/tcp   vigilant_murdock
2912e073cda5   redis     "docker-entrypoint.s…"   7 minutes ago   Exited (0) 4 minutes ago              frosty_curran
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE       COMMAND                  CREATED              STATUS              PORTS      NAMES
c132a922be44   redis:4.0   "docker-entrypoint.s…"   About a minute ago   Up About a minute   6379/tcp   pedantic_goldstine
c9b8da7c85a9   redis       "docker-entrypoint.s…"   7 minutes ago        Up 5 minutes        6379/tcp   vigilant_murdock
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS         PORTS                    NAMES
90c1c8225189   redis     "docker-entrypoint.s…"   11 seconds ago   Up 9 seconds   0.0.0.0:6000->6379/tcp   clever_leakey
coderaman_tech@coderaman:~$ docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED              STATUS                      PORTS                    NAMES
90c1c8225189   redis       "docker-entrypoint.s…"   About a minute ago   Up About a minute           0.0.0.0:6000->6379/tcp   clever_leakey
c132a922be44   redis:4.0   "docker-entrypoint.s…"   10 minutes ago       Exited (0) 3 minutes ago                             pedantic_goldstine
c9b8da7c85a9   redis       "docker-entrypoint.s…"   16 minutes ago       Exited (0) 2 minutes ago                             vigilant_murdock
2912e073cda5   redis       "docker-entrypoint.s…"   20 minutes ago       Exited (0) 18 minutes ago                            frosty_curran
coderaman_tech@coderaman:~$ docker run -p:6000:6379 redis:4.0
docker: Error response from daemon: driver failed programming external connectivity on endpoint stupefied_snyder (0d5b5ab9faae2365530394c1cb8e357f27e954a95732f68a6485036a2e6352b9): Bind for 0.0.0.0:6000 failed: port is already allocated.
ERRO[0000] error waiting for container:                 
coderaman_tech@coderaman:~$ docker run -p:6001:6379 redis:4.0
1:C 03 Jun 20:38:46.048 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 03 Jun 20:38:46.048 # Redis version=4.0.14, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 03 Jun 20:38:46.048 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 03 Jun 20:38:46.051 * Running mode=standalone, port=6379.
1:M 03 Jun 20:38:46.051 # Server initialized
1:M 03 Jun 20:38:46.051 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
1:M 03 Jun 20:38:46.051 * Ready to accept connections
^C1:signal-handler (1685824748) Received SIGINT scheduling shutdown...
1:signal-handler (1685824748) You insist... exiting now.
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                    NAMES
90c1c8225189   redis     "docker-entrypoint.s…"   6 minutes ago   Up 6 minutes   0.0.0.0:6000->6379/tcp   clever_leakey
coderaman_tech@coderaman:~$ docker logs redis
Error response from daemon: No such container: redis
coderaman_tech@coderaman:~$ docker logs 90c1c8225189 
1:C 03 Jun 2023 20:36:09.433 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 03 Jun 2023 20:36:09.435 # Redis version=7.0.11, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 03 Jun 2023 20:36:09.435 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 03 Jun 2023 20:36:09.436 * monotonic clock: POSIX clock_gettime
1:M 03 Jun 2023 20:36:09.462 * Running mode=standalone, port=6379.
1:M 03 Jun 2023 20:36:09.462 # Server initialized
1:M 03 Jun 2023 20:36:09.463 * Ready to accept connections
coderaman_tech@coderaman:~$ docker logs
"docker logs" requires exactly 1 argument.
See 'docker logs --help'.

Usage:  docker logs [OPTIONS] CONTAINER

Fetch the logs of a container
coderaman_tech@coderaman:~$ docker logs redis
Error response from daemon: No such container: redis
coderaman_tech@coderaman:~$ docker logs clever_leakey
1:C 03 Jun 2023 20:36:09.433 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
1:C 03 Jun 2023 20:36:09.435 # Redis version=7.0.11, bits=64, commit=00000000, modified=0, pid=1, just started
1:C 03 Jun 2023 20:36:09.435 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
1:M 03 Jun 2023 20:36:09.436 * monotonic clock: POSIX clock_gettime
1:M 03 Jun 2023 20:36:09.462 * Running mode=standalone, port=6379.
1:M 03 Jun 2023 20:36:09.462 # Server initialized
1:M 03 Jun 2023 20:36:09.463 * Ready to accept connections
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                    NAMES
90c1c8225189   redis     "docker-entrypoint.s…"   11 minutes ago   Up 11 minutes   0.0.0.0:6000->6379/tcp   clever_leakey
coderaman_tech@coderaman:~$ docker stop 90c1c8225189 
90c1c8225189
coderaman_tech@coderaman:~$ docker run -d -p6001:6379 --name aman redis
eb0ea9c6b8896659e3f03ce8bc0799650f0192d26ce0071f1038f13a5bb346bb
coderaman_tech@coderaman:~$ docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                    NAMES
eb0ea9c6b889   redis     "docker-entrypoint.s…"   6 seconds ago   Up 6 seconds   0.0.0.0:6001->6379/tcp   aman
coderaman_tech@coderaman:~$ docker exec -it eb0ea9c6b889 /bin/bash
root@eb0ea9c6b889:/data# ls
root@eb0ea9c6b889:/data# pwd
/data
root@eb0ea9c6b889:/data# cd/
bash: cd/: No such file or directory
root@eb0ea9c6b889:/data# cd /
root@eb0ea9c6b889:/# ls
bin   data  etc   lib	 media	opt   root  sbin  sys  usr
boot  dev   home  lib64  mnt	proc  run   srv   tmp  var
root@eb0ea9c6b889:/# env
HOSTNAME=eb0ea9c6b889
REDIS_DOWNLOAD_SHA=ce250d1fba042c613de38a15d40889b78f7cb6d5461a27e35017ba39b07221e3
PWD=/
HOME=/root
REDIS_VERSION=7.0.11
GOSU_VERSION=1.16
TERM=xterm
REDIS_DOWNLOAD_URL=http://download.redis.io/releases/redis-7.0.11.tar.gz
SHLVL=1
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
_=/usr/bin/env
OLDPWD=/data
root@eb0ea9c6b889:/# exit
exit
coderaman_tech@coderaman:~$ docker exec -it aman  /bin/bash
root@eb0ea9c6b889:/data# 

