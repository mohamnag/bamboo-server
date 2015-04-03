# Bamboo Server
Inspired by https://github.com/hwuethrich/docker-images/tree/master/bamboo-server.

Recommended config for running the resulting image (for an ubuntu host):
```
docker run --name bamboo-server \
   -e BAMBOO_VERSION=5.8.1 -e TZ=Europe/Zurich -e JAVA_OPTS=-Xmx1024m \
   -p 8085:8085 -p 54663:54663 \
   -v /opt/bamboo-server:/home/bamboo -v /usr/bin/docker:/bin/docker -v /run/docker.sock:/run/docker.sock \
   -d hwuethrich/bamboo-server
```


Differences from the original build file:
* This installs Java 8 too
* If you use the above command to run, docker is also fully functional in container out of the box
* There is an script for stopping and removing containers with specific string in name, to be used with bamboo (docker-cc.sh)