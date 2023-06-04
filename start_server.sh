coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker pull mongo
Using default tag: latest
latest: Pulling from library/mongo
Digest: sha256:fb0d2e1151b2de653e1d793515a90c09d0aeaa7807b1184be6f5a6981432cc92
Status: Image is up to date for mongo:latest
docker.io/library/mongo:latest
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker pull mongo-express
Using default tag: latest
latest: Pulling from library/mongo-express
Digest: sha256:dcfcf89bf91238ff129469a5a94523b3025913dcc41597d72d4d5f4a0339cc7d
Status: Image is up to date for mongo-express:latest
docker.io/library/mongo-express:latest
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker image

Usage:  docker image COMMAND

Manage images

Commands:
  build       Build an image from a Dockerfile
  history     Show the history of an image
  import      Import the contents from a tarball to create a filesystem image
  inspect     Display detailed information on one or more images
  load        Load an image from a tar archive or STDIN
  ls          List images
  prune       Remove unused images
  pull        Download an image from a registry
  push        Upload an image to a registry
  rm          Remove one or more images
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE

Run 'docker image COMMAND --help' for more information on a command.
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker images
REPOSITORY      TAG       IMAGE ID       CREATED         SIZE
mongo           latest    1f4172d24883   2 days ago      653MB
redis           latest    0ec8ab59a35f   12 days ago     117MB
mongo-express   latest    2d2fb2cabc8f   19 months ago   136MB
redis           4.0       191c4017dcdd   3 years ago     89.3MB
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker network ls
NETWORK ID     NAME            DRIVER    SCOPE
6938ef3e7cc9   bridge          bridge    local
6e5d586f4b10   host            host      local
289f19c0e085   mongo-network   bridge    local
15c826fb9489   none            null      local
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker network rm mongo-network
mongo-network
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker network ls
NETWORK ID     NAME      DRIVER    SCOPE
6938ef3e7cc9   bridge    bridge    local
6e5d586f4b10   host      host      local
15c826fb9489   none      null      local
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ network create mongo-network
network: command not found
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker network create mongo-network
efe2132a09f336ce8d4767ffd2221980363dcbbc7ca3e546fd62edba819f2386
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker network ls
NETWORK ID     NAME            DRIVER    SCOPE
6938ef3e7cc9   bridge          bridge    local
6e5d586f4b10   host            host      local
efe2132a09f3   mongo-network   bridge    local
15c826fb9489   none            null      local
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network  mongo
docker: Error response from daemon: Conflict. The container name "/mongodb" is already in use by container "2e9b52738bc634afcffd48c85c681ebf7311104e3d43b1f071701ab4c5dde8cc". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker stop 2e9b52738bc634afcffd48c85c681ebf7311104e3d43b1f071701ab4c5dde8cc
2e9b52738bc634afcffd48c85c681ebf7311104e3d43b1f071701ab4c5dde8cc
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network  mongo
docker: Error response from daemon: Conflict. The container name "/mongodb" is already in use by container "2e9b52738bc634afcffd48c85c681ebf7311104e3d43b1f071701ab4c5dde8cc". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED        STATUS                      PORTS                      NAMES
cd668b6ca0aa   mongo-express   "tini -- /docker-ent…"   18 hours ago   Exited (0) 12 minutes ago   0.0.0.0:8081->8081/tcp     mongo-express
2e9b52738bc6   mongo           "docker-entrypoint.s…"   19 hours ago   Exited (0) 12 minutes ago   0.0.0.0:27017->27017/tcp   mongodb
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker stop 2e9b52738bc6  
2e9b52738bc6
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED        STATUS                      PORTS                      NAMES
cd668b6ca0aa   mongo-express   "tini -- /docker-ent…"   18 hours ago   Exited (0) 12 minutes ago   0.0.0.0:8081->8081/tcp     mongo-express
2e9b52738bc6   mongo           "docker-entrypoint.s…"   19 hours ago   Exited (0) 12 minutes ago   0.0.0.0:27017->27017/tcp   mongodb
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker rm /mongo
Error response from daemon: No such container: mongo
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker rm /mongodb
/mongodb
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED        STATUS                      PORTS                    NAMES
cd668b6ca0aa   mongo-express   "tini -- /docker-ent…"   18 hours ago   Exited (0) 14 minutes ago   0.0.0.0:8081->8081/tcp   mongo-express
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker pull mongo
Using default tag: latest
latest: Pulling from library/mongo
Digest: sha256:fb0d2e1151b2de653e1d793515a90c09d0aeaa7807b1184be6f5a6981432cc92
Status: Image is up to date for mongo:latest
docker.io/library/mongo:latest
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker run -d -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=password --name mongodb --net mongo-network  mongo
f088e71a3e332262e32a3ae52f4f2b36407e1b37b002665086da2ef6529067f7
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker logs f088e71a3e332262e32a3ae52f4f2b36407e1b37b002665086da2ef6529067f7
about to fork child process, waiting until server is ready for connections.
forked process: 28

{"t":{"$date":"2023-06-04T16:37:29.652+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"-","msg":"***** SERVER RESTARTED *****"}
{"t":{"$date":"2023-06-04T16:37:29.657+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2023-06-04T16:37:29.658+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":17},"outgoing":{"minWireVersion":6,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:29.659+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2023-06-04T16:37:29.662+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2023-06-04T16:37:29.662+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2023-06-04T16:37:29.662+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"ShardSplitDonorService","namespace":"config.tenantSplitDonors"}}
{"t":{"$date":"2023-06-04T16:37:29.662+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2023-06-04T16:37:29.663+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":28,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"f088e71a3e33"}}
{"t":{"$date":"2023-06-04T16:37:29.663+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"6.0.6","gitVersion":"26b4851a412cc8b9b4a18cdb6cd0f9f642e06aa7","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2023-06-04T16:37:29.663+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2023-06-04T16:37:29.663+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"127.0.0.1","port":27017,"tls":{"mode":"disabled"}},"processManagement":{"fork":true,"pidFilePath":"/tmp/docker-entrypoint-temp-mongod.pid"},"systemLog":{"destination":"file","logAppend":true,"path":"/proc/1/fd/1"}}}}
{"t":{"$date":"2023-06-04T16:37:29.665+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2023-06-04T16:37:29.665+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=256M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2023-06-04T16:37:29.932+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":266}}
{"t":{"$date":"2023-06-04T16:37:29.932+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2023-06-04T16:37:30.009+00:00"},"s":"W",  "c":"CONTROL",  "id":22120,   "ctx":"initandlisten","msg":"Access control is not enabled for the database. Read and write access to data and configuration is unrestricted","tags":["startupWarnings"]}
{"t":{"$date":"2023-06-04T16:37:30.010+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":262144,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2023-06-04T16:37:30.011+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"admin.system.version","uuidDisposition":"provided","uuid":{"uuid":{"$uuid":"554a87be-15db-4fd3-be29-078baacfef7d"}},"options":{"uuid":{"$uuid":"554a87be-15db-4fd3-be29-078baacfef7d"}}}}
{"t":{"$date":"2023-06-04T16:37:30.057+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"554a87be-15db-4fd3-be29-078baacfef7d"}},"namespace":"admin.system.version","index":"_id_","ident":"index-1-354010357798385490","collectionIdent":"collection-0-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:30.058+00:00"},"s":"I",  "c":"REPL",     "id":20459,   "ctx":"initandlisten","msg":"Setting featureCompatibilityVersion","attr":{"newVersion":"6.0"}}
{"t":{"$date":"2023-06-04T16:37:30.058+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"6.0","context":"setFCV"}}
{"t":{"$date":"2023-06-04T16:37:30.058+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":17},"outgoing":{"minWireVersion":6,"maxWireVersion":17},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":17,"maxWireVersion":17},"outgoing":{"minWireVersion":17,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:30.058+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":17,"maxWireVersion":17},"outgoing":{"minWireVersion":17,"maxWireVersion":17},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":17,"maxWireVersion":17},"outgoing":{"minWireVersion":17,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:30.059+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"6.0","context":"startup"}}
{"t":{"$date":"2023-06-04T16:37:30.059+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2023-06-04T16:37:30.059+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2023-06-04T16:37:30.075+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2023-06-04T16:37:30.091+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"initandlisten","msg":"createCollection","attr":{"namespace":"local.startup_log","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"d1283684-10b8-4c3a-b896-9575a7e354c7"}},"options":{"capped":true,"size":10485760}}}
{"t":{"$date":"2023-06-04T16:37:30.131+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"initandlisten","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d1283684-10b8-4c3a-b896-9575a7e354c7"}},"namespace":"local.startup_log","index":"_id_","ident":"index-3-354010357798385490","collectionIdent":"collection-2-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:30.133+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2023-06-04T16:37:30.134+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2023-06-04T16:37:30.140+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2023-06-04T16:37:30.140+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"127.0.0.1"}}
{"t":{"$date":"2023-06-04T16:37:30.140+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
child process started successfully, parent exiting
{"t":{"$date":"2023-06-04T16:37:30.150+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"LogicalSessionCacheRefresh","msg":"createCollection","attr":{"namespace":"config.system.sessions","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"1027b1a5-5c17-4a3b-b1d5-29cb48a7a58b"}},"options":{}}}
{"t":{"$date":"2023-06-04T16:37:30.150+00:00"},"s":"I",  "c":"CONTROL",  "id":20712,   "ctx":"LogicalSessionCacheReap","msg":"Sessions collection is not set up; waiting until next sessions reap interval","attr":{"error":"NamespaceNotFound: config.system.sessions does not exist"}}
{"t":{"$date":"2023-06-04T16:37:30.209+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"1027b1a5-5c17-4a3b-b1d5-29cb48a7a58b"}},"namespace":"config.system.sessions","index":"_id_","ident":"index-5-354010357798385490","collectionIdent":"collection-4-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:30.209+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"LogicalSessionCacheRefresh","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"1027b1a5-5c17-4a3b-b1d5-29cb48a7a58b"}},"namespace":"config.system.sessions","index":"lsidTTLIndex","ident":"index-6-354010357798385490","collectionIdent":"collection-4-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:30.729+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:42456","uuid":"af896217-3bd7-4156-a1f6-7692fb30e46c","connectionId":1,"connectionCount":1}}
{"t":{"$date":"2023-06-04T16:37:30.733+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn1","msg":"client metadata","attr":{"remote":"127.0.0.1:42456","client":"conn1","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:30.748+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:42460","uuid":"590359cf-7841-477d-bda9-dc42324a079b","connectionId":2,"connectionCount":2}}
{"t":{"$date":"2023-06-04T16:37:30.748+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:42474","uuid":"c1b76ab0-3f3a-4b24-9b6e-7a5134e63725","connectionId":3,"connectionCount":3}}
{"t":{"$date":"2023-06-04T16:37:30.750+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn2","msg":"client metadata","attr":{"remote":"127.0.0.1:42460","client":"conn2","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:30.750+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn3","msg":"client metadata","attr":{"remote":"127.0.0.1:42474","client":"conn3","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:30.753+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:42486","uuid":"4ea1174d-0c70-4e64-8d8d-144d4dd237c7","connectionId":4,"connectionCount":4}}
{"t":{"$date":"2023-06-04T16:37:30.755+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:42502","uuid":"5cb675e4-0257-4ee4-a348-6902f823e197","connectionId":5,"connectionCount":5}}
{"t":{"$date":"2023-06-04T16:37:30.756+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn4","msg":"client metadata","attr":{"remote":"127.0.0.1:42486","client":"conn4","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:30.759+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn5","msg":"client metadata","attr":{"remote":"127.0.0.1:42502","client":"conn5","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:31.052+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn3","msg":"Connection ended","attr":{"remote":"127.0.0.1:42474","uuid":"c1b76ab0-3f3a-4b24-9b6e-7a5134e63725","connectionId":3,"connectionCount":4}}
{"t":{"$date":"2023-06-04T16:37:31.052+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn4","msg":"Connection ended","attr":{"remote":"127.0.0.1:42486","uuid":"4ea1174d-0c70-4e64-8d8d-144d4dd237c7","connectionId":4,"connectionCount":3}}
{"t":{"$date":"2023-06-04T16:37:31.052+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn2","msg":"Connection ended","attr":{"remote":"127.0.0.1:42460","uuid":"590359cf-7841-477d-bda9-dc42324a079b","connectionId":2,"connectionCount":2}}
{"t":{"$date":"2023-06-04T16:37:31.052+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn1","msg":"Connection ended","attr":{"remote":"127.0.0.1:42456","uuid":"af896217-3bd7-4156-a1f6-7692fb30e46c","connectionId":1,"connectionCount":1}}
{"t":{"$date":"2023-06-04T16:37:31.053+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn5","msg":"Connection ended","attr":{"remote":"127.0.0.1:42502","uuid":"5cb675e4-0257-4ee4-a348-6902f823e197","connectionId":5,"connectionCount":0}}
{"t":{"$date":"2023-06-04T16:37:31.501+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:43026","uuid":"2f4274c9-a128-4c10-b18d-2a91f03c968d","connectionId":6,"connectionCount":1}}
{"t":{"$date":"2023-06-04T16:37:31.505+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn6","msg":"client metadata","attr":{"remote":"127.0.0.1:43026","client":"conn6","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:31.518+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:43030","uuid":"e1681d21-c07b-4962-a2df-41982b2563f4","connectionId":7,"connectionCount":2}}
{"t":{"$date":"2023-06-04T16:37:31.519+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:43042","uuid":"a9a7726f-c126-4a8e-9c75-e49f4d7d9a6a","connectionId":8,"connectionCount":3}}
{"t":{"$date":"2023-06-04T16:37:31.520+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn7","msg":"client metadata","attr":{"remote":"127.0.0.1:43030","client":"conn7","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:31.521+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn8","msg":"client metadata","attr":{"remote":"127.0.0.1:43042","client":"conn8","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
{"t":{"$date":"2023-06-04T16:37:31.523+00:00"},"s":"I",  "c":"NETWORK",  "id":22943,   "ctx":"listener","msg":"Connection accepted","attr":{"remote":"127.0.0.1:43056","uuid":"faf48e2c-4f48-439b-aaf2-46989bf7549c","connectionId":9,"connectionCount":4}}
{"t":{"$date":"2023-06-04T16:37:31.528+00:00"},"s":"I",  "c":"NETWORK",  "id":51800,   "ctx":"conn9","msg":"client metadata","attr":{"remote":"127.0.0.1:43056","client":"conn9","doc":{"application":{"name":"mongosh 1.9.1"},"driver":{"name":"nodejs|mongosh","version":"5.5.0|1.9.1"},"platform":"Node.js v16.20.0, LE","os":{"name":"linux","architecture":"x64","version":"5.15.49-linuxkit-pr","type":"Linux"}}}}
admin> ... ... ... ... {"t":{"$date":"2023-06-04T16:37:32.089+00:00"},"s":"I",  "c":"STORAGE",  "id":20320,   "ctx":"conn9","msg":"createCollection","attr":{"namespace":"admin.system.users","uuidDisposition":"generated","uuid":{"uuid":{"$uuid":"d0283ec2-78b4-4f58-b134-b784521ea05a"}},"options":{}}}
{"t":{"$date":"2023-06-04T16:37:32.197+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn9","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d0283ec2-78b4-4f58-b134-b784521ea05a"}},"namespace":"admin.system.users","index":"_id_","ident":"index-8-354010357798385490","collectionIdent":"collection-7-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:32.197+00:00"},"s":"I",  "c":"INDEX",    "id":20345,   "ctx":"conn9","msg":"Index build: done building","attr":{"buildUUID":null,"collectionUUID":{"uuid":{"$uuid":"d0283ec2-78b4-4f58-b134-b784521ea05a"}},"namespace":"admin.system.users","index":"user_1_db_1","ident":"index-9-354010357798385490","collectionIdent":"collection-7-354010357798385490","commitTimestamp":null}}
{"t":{"$date":"2023-06-04T16:37:32.198+00:00"},"s":"I",  "c":"COMMAND",  "id":51803,   "ctx":"conn9","msg":"Slow query","attr":{"type":"command","ns":"admin.system.users","appName":"mongosh 1.9.1","command":{"insert":"system.users","bypassDocumentValidation":false,"ordered":true,"$db":"admin"},"ninserted":1,"keysInserted":2,"numYields":0,"reslen":45,"locks":{"ParallelBatchWriterMode":{"acquireCount":{"r":4}},"FeatureCompatibilityVersion":{"acquireCount":{"w":4}},"ReplicationStateTransition":{"acquireCount":{"w":4}},"Global":{"acquireCount":{"w":4}},"Database":{"acquireCount":{"w":4}},"Collection":{"acquireCount":{"w":4}},"Mutex":{"acquireCount":{"r":5}}},"flowControl":{"acquireCount":4,"timeAcquiringMicros":19},"storage":{},"remote":"127.0.0.1:43056","protocol":"op_msg","durationMillis":110}}
{"t":{"$date":"2023-06-04T16:37:32.199+00:00"},"s":"I",  "c":"COMMAND",  "id":51803,   "ctx":"conn9","msg":"Slow query","attr":{"type":"command","ns":"admin.$cmd","appName":"mongosh 1.9.1","command":{"createUser":"admin","pwd":"xxx","roles":[{"role":"root","db":"admin"}],"lsid":{"id":{"$uuid":"83e239ae-d47d-415e-b87d-22541aa7d34d"}},"$db":"admin"},"numYields":0,"reslen":38,"locks":{"ParallelBatchWriterMode":{"acquireCount":{"r":4}},"FeatureCompatibilityVersion":{"acquireCount":{"r":1,"w":4}},"ReplicationStateTransition":{"acquireCount":{"w":5}},"Global":{"acquireCount":{"r":1,"w":4}},"Database":{"acquireCount":{"w":4}},"Collection":{"acquireCount":{"w":4}},"Mutex":{"acquireCount":{"r":5}}},"flowControl":{"acquireCount":4,"timeAcquiringMicros":19},"storage":{},"remote":"127.0.0.1:43056","protocol":"op_msg","durationMillis":161}}
{ ok: 1 }
admin> {"t":{"$date":"2023-06-04T16:37:32.260+00:00"},"s":"I",  "c":"-",        "id":20883,   "ctx":"conn6","msg":"Interrupted operation as its client disconnected","attr":{"opId":57}}
{"t":{"$date":"2023-06-04T16:37:32.261+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn8","msg":"Connection ended","attr":{"remote":"127.0.0.1:43042","uuid":"a9a7726f-c126-4a8e-9c75-e49f4d7d9a6a","connectionId":8,"connectionCount":3}}
{"t":{"$date":"2023-06-04T16:37:32.262+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn7","msg":"Connection ended","attr":{"remote":"127.0.0.1:43030","uuid":"e1681d21-c07b-4962-a2df-41982b2563f4","connectionId":7,"connectionCount":2}}
{"t":{"$date":"2023-06-04T16:37:32.262+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn6","msg":"Connection ended","attr":{"remote":"127.0.0.1:43026","uuid":"2f4274c9-a128-4c10-b18d-2a91f03c968d","connectionId":6,"connectionCount":1}}
{"t":{"$date":"2023-06-04T16:37:32.262+00:00"},"s":"I",  "c":"NETWORK",  "id":22944,   "ctx":"conn9","msg":"Connection ended","attr":{"remote":"127.0.0.1:43056","uuid":"faf48e2c-4f48-439b-aaf2-46989bf7549c","connectionId":9,"connectionCount":0}}

/usr/local/bin/docker-entrypoint.sh: ignoring /docker-entrypoint-initdb.d/*


{"t":{"$date":"2023-06-04T16:37:33.350+00:00"},"s":"I",  "c":"CONTROL",  "id":20698,   "ctx":"-","msg":"***** SERVER RESTARTED *****"}
{"t":{"$date":"2023-06-04T16:37:33.350+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"main","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2023-06-04T16:37:33.352+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":17},"outgoing":{"minWireVersion":6,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:33.352+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"ShardSplitDonorService","namespace":"config.tenantSplitDonors"}}
Killing process with pid: 28
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"CONTROL",  "id":23377,   "ctx":"SignalHandler","msg":"Received signal","attr":{"signal":15,"error":"Terminated"}}
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"CONTROL",  "id":23378,   "ctx":"SignalHandler","msg":"Signal was sent by kill(2)","attr":{"pid":102,"uid":999}}
{"t":{"$date":"2023-06-04T16:37:33.353+00:00"},"s":"I",  "c":"CONTROL",  "id":23381,   "ctx":"SignalHandler","msg":"will terminate after current cmd ends"}
{"t":{"$date":"2023-06-04T16:37:33.354+00:00"},"s":"I",  "c":"REPL",     "id":4784900, "ctx":"SignalHandler","msg":"Stepping down the ReplicationCoordinator for shutdown","attr":{"waitTimeMillis":15000}}
{"t":{"$date":"2023-06-04T16:37:33.354+00:00"},"s":"I",  "c":"REPL",     "id":4794602, "ctx":"SignalHandler","msg":"Attempting to enter quiesce mode"}
{"t":{"$date":"2023-06-04T16:37:33.354+00:00"},"s":"I",  "c":"-",        "id":6371601, "ctx":"SignalHandler","msg":"Shutting down the FLE Crud thread pool"}
{"t":{"$date":"2023-06-04T16:37:33.354+00:00"},"s":"I",  "c":"COMMAND",  "id":4784901, "ctx":"SignalHandler","msg":"Shutting down the MirrorMaestro"}
{"t":{"$date":"2023-06-04T16:37:33.354+00:00"},"s":"I",  "c":"SHARDING", "id":4784902, "ctx":"SignalHandler","msg":"Shutting down the WaitForMajorityService"}
{"t":{"$date":"2023-06-04T16:37:33.355+00:00"},"s":"I",  "c":"CONTROL",  "id":4784903, "ctx":"SignalHandler","msg":"Shutting down the LogicalSessionCache"}
{"t":{"$date":"2023-06-04T16:37:33.355+00:00"},"s":"I",  "c":"NETWORK",  "id":20562,   "ctx":"SignalHandler","msg":"Shutdown: going to close listening sockets"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"NETWORK",  "id":23017,   "ctx":"listener","msg":"removing socket file","attr":{"path":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"NETWORK",  "id":4784905, "ctx":"SignalHandler","msg":"Shutting down the global connection pool"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"CONTROL",  "id":4784906, "ctx":"SignalHandler","msg":"Shutting down the FlowControlTicketholder"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"-",        "id":20520,   "ctx":"SignalHandler","msg":"Stopping further Flow Control ticket acquisitions."}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"CONTROL",  "id":4784908, "ctx":"SignalHandler","msg":"Shutting down the PeriodicThreadToAbortExpiredTransactions"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"REPL",     "id":4784909, "ctx":"SignalHandler","msg":"Shutting down the ReplicationCoordinator"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"SHARDING", "id":4784910, "ctx":"SignalHandler","msg":"Shutting down the ShardingInitializationMongoD"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"REPL",     "id":4784911, "ctx":"SignalHandler","msg":"Enqueuing the ReplicationStateTransitionLock for shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"-",        "id":4784912, "ctx":"SignalHandler","msg":"Killing all operations for shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"-",        "id":4695300, "ctx":"SignalHandler","msg":"Interrupted all currently running operations","attr":{"opsKilled":3}}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"TENANT_M", "id":5093807, "ctx":"SignalHandler","msg":"Shutting down all TenantMigrationAccessBlockers on global shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.358+00:00"},"s":"I",  "c":"COMMAND",  "id":4784913, "ctx":"SignalHandler","msg":"Shutting down all open transactions"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"REPL",     "id":4784914, "ctx":"SignalHandler","msg":"Acquiring the ReplicationStateTransitionLock for shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"INDEX",    "id":4784915, "ctx":"SignalHandler","msg":"Shutting down the IndexBuildsCoordinator"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"NETWORK",  "id":4784918, "ctx":"SignalHandler","msg":"Shutting down the ReplicaSetMonitor"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"SHARDING", "id":4784921, "ctx":"SignalHandler","msg":"Shutting down the MigrationUtilExecutor"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"ASIO",     "id":22582,   "ctx":"MigrationUtil-TaskExecutor","msg":"Killing all outstanding egress activity."}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"COMMAND",  "id":4784923, "ctx":"SignalHandler","msg":"Shutting down the ServiceEntryPoint"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"CONTROL",  "id":4784925, "ctx":"SignalHandler","msg":"Shutting down free monitoring"}
{"t":{"$date":"2023-06-04T16:37:33.359+00:00"},"s":"I",  "c":"CONTROL",  "id":20609,   "ctx":"SignalHandler","msg":"Shutting down free monitoring"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"CONTROL",  "id":4784927, "ctx":"SignalHandler","msg":"Shutting down the HealthLog"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"CONTROL",  "id":4784928, "ctx":"SignalHandler","msg":"Shutting down the TTL monitor"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"INDEX",    "id":3684100, "ctx":"SignalHandler","msg":"Shutting down TTL collection monitor thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"INDEX",    "id":3684101, "ctx":"SignalHandler","msg":"Finished shutting down TTL collection monitor thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"CONTROL",  "id":6278511, "ctx":"SignalHandler","msg":"Shutting down the Change Stream Expired Pre-images Remover"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"CONTROL",  "id":4784929, "ctx":"SignalHandler","msg":"Acquiring the global lock for shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"CONTROL",  "id":4784930, "ctx":"SignalHandler","msg":"Shutting down the storage engine"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":22320,   "ctx":"SignalHandler","msg":"Shutting down journal flusher thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":22321,   "ctx":"SignalHandler","msg":"Finished shutting down journal flusher thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":22322,   "ctx":"SignalHandler","msg":"Shutting down checkpoint thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":22323,   "ctx":"SignalHandler","msg":"Finished shutting down checkpoint thread"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":20282,   "ctx":"SignalHandler","msg":"Deregistering all the collections"}
{"t":{"$date":"2023-06-04T16:37:33.360+00:00"},"s":"I",  "c":"STORAGE",  "id":22261,   "ctx":"SignalHandler","msg":"Timestamp monitor shutting down"}
{"t":{"$date":"2023-06-04T16:37:33.361+00:00"},"s":"I",  "c":"STORAGE",  "id":22317,   "ctx":"SignalHandler","msg":"WiredTigerKVEngine shutting down"}
{"t":{"$date":"2023-06-04T16:37:33.361+00:00"},"s":"I",  "c":"STORAGE",  "id":22318,   "ctx":"SignalHandler","msg":"Shutting down session sweeper thread"}
{"t":{"$date":"2023-06-04T16:37:33.361+00:00"},"s":"I",  "c":"STORAGE",  "id":22319,   "ctx":"SignalHandler","msg":"Finished shutting down session sweeper thread"}
{"t":{"$date":"2023-06-04T16:37:33.363+00:00"},"s":"I",  "c":"STORAGE",  "id":4795902, "ctx":"SignalHandler","msg":"Closing WiredTiger","attr":{"closeConfig":"leak_memory=true,"}}
{"t":{"$date":"2023-06-04T16:37:33.528+00:00"},"s":"I",  "c":"STORAGE",  "id":4795901, "ctx":"SignalHandler","msg":"WiredTiger closed","attr":{"durationMillis":165}}
{"t":{"$date":"2023-06-04T16:37:33.528+00:00"},"s":"I",  "c":"STORAGE",  "id":22279,   "ctx":"SignalHandler","msg":"shutdown: removing fs lock..."}
{"t":{"$date":"2023-06-04T16:37:33.528+00:00"},"s":"I",  "c":"-",        "id":4784931, "ctx":"SignalHandler","msg":"Dropping the scope cache for shutdown"}
{"t":{"$date":"2023-06-04T16:37:33.528+00:00"},"s":"I",  "c":"FTDC",     "id":20626,   "ctx":"SignalHandler","msg":"Shutting down full-time diagnostic data capture"}
{"t":{"$date":"2023-06-04T16:37:33.534+00:00"},"s":"I",  "c":"CONTROL",  "id":20565,   "ctx":"SignalHandler","msg":"Now exiting"}
{"t":{"$date":"2023-06-04T16:37:33.535+00:00"},"s":"I",  "c":"CONTROL",  "id":23138,   "ctx":"SignalHandler","msg":"Shutting down","attr":{"exitCode":0}}

MongoDB init process complete; ready for start up.

{"t":{"$date":"2023-06-04T16:37:34.406+00:00"},"s":"I",  "c":"CONTROL",  "id":23285,   "ctx":"-","msg":"Automatically disabling TLS 1.0, to force-enable TLS 1.0 specify --sslDisabledProtocols 'none'"}
{"t":{"$date":"2023-06-04T16:37:34.408+00:00"},"s":"I",  "c":"NETWORK",  "id":4915701, "ctx":"main","msg":"Initialized wire specification","attr":{"spec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":17},"outgoing":{"minWireVersion":6,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:34.408+00:00"},"s":"I",  "c":"NETWORK",  "id":4648601, "ctx":"main","msg":"Implicit TCP FastOpen unavailable. If TCP FastOpen is required, set tcpFastOpenServer, tcpFastOpenClient, and tcpFastOpenQueueSize."}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationDonorService","namespace":"config.tenantMigrationDonors"}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"TenantMigrationRecipientService","namespace":"config.tenantMigrationRecipients"}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"REPL",     "id":5123008, "ctx":"main","msg":"Successfully registered PrimaryOnlyService","attr":{"service":"ShardSplitDonorService","namespace":"config.tenantSplitDonors"}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"CONTROL",  "id":5945603, "ctx":"main","msg":"Multi threading initialized"}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"CONTROL",  "id":4615611, "ctx":"initandlisten","msg":"MongoDB starting","attr":{"pid":1,"port":27017,"dbPath":"/data/db","architecture":"64-bit","host":"f088e71a3e33"}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"CONTROL",  "id":23403,   "ctx":"initandlisten","msg":"Build Info","attr":{"buildInfo":{"version":"6.0.6","gitVersion":"26b4851a412cc8b9b4a18cdb6cd0f9f642e06aa7","openSSLVersion":"OpenSSL 3.0.2 15 Mar 2022","modules":[],"allocator":"tcmalloc","environment":{"distmod":"ubuntu2204","distarch":"x86_64","target_arch":"x86_64"}}}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"CONTROL",  "id":51765,   "ctx":"initandlisten","msg":"Operating System","attr":{"os":{"name":"Ubuntu","version":"22.04"}}}
{"t":{"$date":"2023-06-04T16:37:34.409+00:00"},"s":"I",  "c":"CONTROL",  "id":21951,   "ctx":"initandlisten","msg":"Options set by command line","attr":{"options":{"net":{"bindIp":"*"},"security":{"authorization":"enabled"}}}}
{"t":{"$date":"2023-06-04T16:37:34.410+00:00"},"s":"I",  "c":"STORAGE",  "id":22270,   "ctx":"initandlisten","msg":"Storage engine to use detected by data files","attr":{"dbpath":"/data/db","storageEngine":"wiredTiger"}}
{"t":{"$date":"2023-06-04T16:37:34.410+00:00"},"s":"I",  "c":"STORAGE",  "id":22297,   "ctx":"initandlisten","msg":"Using the XFS filesystem is strongly recommended with the WiredTiger storage engine. See http://dochub.mongodb.org/core/prodnotes-filesystem","tags":["startupWarnings"]}
{"t":{"$date":"2023-06-04T16:37:34.410+00:00"},"s":"I",  "c":"STORAGE",  "id":22315,   "ctx":"initandlisten","msg":"Opening WiredTiger","attr":{"config":"create,cache_size=256M,session_max=33000,eviction=(threads_min=4,threads_max=4),config_base=false,statistics=(fast),log=(enabled=true,remove=true,path=journal,compressor=snappy),builtin_extension_config=(zstd=(compression_level=6)),file_manager=(close_idle_time=600,close_scan_interval=10,close_handle_minimum=2000),statistics_log=(wait=0),json_output=(error,message),verbose=[recovery_progress:1,checkpoint_progress:1,compact_progress:1,backup:0,checkpoint:0,compact:0,evict:0,history_store:0,recovery:0,rts:0,salvage:0,tiered:0,timestamp:0,transaction:0,verify:0,log:0],"}}
{"t":{"$date":"2023-06-04T16:37:35.488+00:00"},"s":"I",  "c":"STORAGE",  "id":4795906, "ctx":"initandlisten","msg":"WiredTiger opened","attr":{"durationMillis":1078}}
{"t":{"$date":"2023-06-04T16:37:35.489+00:00"},"s":"I",  "c":"RECOVERY", "id":23987,   "ctx":"initandlisten","msg":"WiredTiger recoveryTimestamp","attr":{"recoveryTimestamp":{"$timestamp":{"t":0,"i":0}}}}
{"t":{"$date":"2023-06-04T16:37:35.514+00:00"},"s":"W",  "c":"CONTROL",  "id":5123300, "ctx":"initandlisten","msg":"vm.max_map_count is too low","attr":{"currentValue":262144,"recommendedMinimum":1677720,"maxConns":838860},"tags":["startupWarnings"]}
{"t":{"$date":"2023-06-04T16:37:35.526+00:00"},"s":"I",  "c":"NETWORK",  "id":4915702, "ctx":"initandlisten","msg":"Updated wire specification","attr":{"oldSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":0,"maxWireVersion":17},"outgoing":{"minWireVersion":6,"maxWireVersion":17},"isInternalClient":true},"newSpec":{"incomingExternalClient":{"minWireVersion":0,"maxWireVersion":17},"incomingInternalClient":{"minWireVersion":17,"maxWireVersion":17},"outgoing":{"minWireVersion":17,"maxWireVersion":17},"isInternalClient":true}}}
{"t":{"$date":"2023-06-04T16:37:35.527+00:00"},"s":"I",  "c":"REPL",     "id":5853300, "ctx":"initandlisten","msg":"current featureCompatibilityVersion value","attr":{"featureCompatibilityVersion":"6.0","context":"startup"}}
{"t":{"$date":"2023-06-04T16:37:35.527+00:00"},"s":"I",  "c":"STORAGE",  "id":5071100, "ctx":"initandlisten","msg":"Clearing temp directory"}
{"t":{"$date":"2023-06-04T16:37:35.530+00:00"},"s":"I",  "c":"CONTROL",  "id":20536,   "ctx":"initandlisten","msg":"Flow Control is enabled on this deployment"}
{"t":{"$date":"2023-06-04T16:37:35.530+00:00"},"s":"I",  "c":"FTDC",     "id":20625,   "ctx":"initandlisten","msg":"Initializing full-time diagnostic data capture","attr":{"dataDirectory":"/data/db/diagnostic.data"}}
{"t":{"$date":"2023-06-04T16:37:35.544+00:00"},"s":"I",  "c":"REPL",     "id":6015317, "ctx":"initandlisten","msg":"Setting new configuration state","attr":{"newState":"ConfigReplicationDisabled","oldState":"ConfigPreStart"}}
{"t":{"$date":"2023-06-04T16:37:35.545+00:00"},"s":"I",  "c":"STORAGE",  "id":22262,   "ctx":"initandlisten","msg":"Timestamp monitor starting"}
{"t":{"$date":"2023-06-04T16:37:35.547+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"/tmp/mongodb-27017.sock"}}
{"t":{"$date":"2023-06-04T16:37:35.547+00:00"},"s":"I",  "c":"NETWORK",  "id":23015,   "ctx":"listener","msg":"Listening on","attr":{"address":"0.0.0.0"}}
{"t":{"$date":"2023-06-04T16:37:35.547+00:00"},"s":"I",  "c":"NETWORK",  "id":23016,   "ctx":"listener","msg":"Waiting for connections","attr":{"port":27017,"ssl":"off"}}
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker run -d \
> -p 8081:8081 \
> -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
> -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
> --net mongo-network \
> --name mongo-express \
> -e ME_CONFIG_MONGODB_SERVER=mongodb \
> mongo-express
docker: Error response from daemon: Conflict. The container name "/mongo-express" is already in use by container "cd668b6ca0aa11ebc9bcdd219340bd372d229f88b2f3d8499c5101177d483652". You have to remove (or rename) that container to be able to reuse that name.
See 'docker run --help'.
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps -a
CONTAINER ID   IMAGE           COMMAND                  CREATED         STATUS                      PORTS                      NAMES
f088e71a3e33   mongo           "docker-entrypoint.s…"   4 minutes ago   Up 4 minutes                0.0.0.0:27017->27017/tcp   mongodb
cd668b6ca0aa   mongo-express   "tini -- /docker-ent…"   18 hours ago    Exited (0) 19 minutes ago   0.0.0.0:8081->8081/tcp     mongo-express
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker rm \mongo-express
mongo-express
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps -a
CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                      NAMES
f088e71a3e33   mongo     "docker-entrypoint.s…"   5 minutes ago   Up 5 minutes   0.0.0.0:27017->27017/tcp   mongodb
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker run -d -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin -e ME_CONFIG_MONGODB_ADMINPASSWORD=password --net mongo-network --name mongo-express -e ME_CONFIG_MONGODB_SERVER=mongodb mongo-express
ce6d389a33f71eaab12c759f9de9e96116be741a69e45e432c7320d8f2522bec
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker logs ce6d389a33f71eaab12c759f9de9e96116be741a69e45e432c7320d8f2522bec
Welcome to mongo-express
------------------------


(node:7) [MONGODB DRIVER] Warning: Current Server Discovery and Monitoring engine is deprecated, and will be removed in a future version. To use the new Server Discover and Monitoring engine, pass option { useUnifiedTopology: true } to the MongoClient constructor.
Mongo Express server listening at http://0.0.0.0:8081
Server is open to allow connections from anyone (0.0.0.0)
basicAuth credentials are "admin:pass", it is recommended you change this in your config.js!
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ dokcer ps
Command 'dokcer' not found, did you mean:
  command 'docker' from snap docker (20.10.24)
  command 'docker' from deb docker.io (20.10.21-0ubuntu1~22.04.3)
  command 'docker' from deb podman-docker (3.4.4+ds1-1ubuntu1)
See 'snap info <snapname>' for additional versions.
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED          STATUS          PORTS                      NAMES
ce6d389a33f7   mongo-express   "tini -- /docker-ent…"   16 minutes ago   Up 16 minutes   0.0.0.0:8081->8081/tcp     mongo-express
f088e71a3e33   mongo           "docker-entrypoint.s…"   21 minutes ago   Up 21 minutes   0.0.0.0:27017->27017/tcp   mongodb
coderaman_tech@coderaman:~/Documents/Github/Batman-Portfolio$ docker ps
CONTAINER ID   IMAGE           COMMAND                  CREATED       STATUS       PORTS                      NAMES
ce6d389a33f7   mongo-express   "tini -- /docker-ent…"   2 hours ago   Up 2 hours   0.0.0.0:8081->8081/tcp     mongo-express
f088e71a3e33   mongo           "docker-entrypoint.s…"   2 hours ago   Up 2 hours   0.0.0.0:27017->27017/tcp   mongodb
