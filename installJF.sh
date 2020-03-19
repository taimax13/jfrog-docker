#!/bin/bash
JFROG_HOME=$(pwd)
echo "Creating an artifactory in $JFROG_HOME"
mkdir -p $JFROG_HOME/artifactory/var/etc/
cd $JFROG_HOME/artifactory/var/etc/
echo "Creating system.yaml confiuration file"
touch ./system.yaml
chown -R 1030:1030 $JFROG_HOME/artifactory/var
echo "Updating admin password credentials"
cp ./bootstrap.creds $JFROG_HOME/artifactory/var/etc/access
chmod 600 $JFROG_HOME/artifactory/var/etc/access
echo "Running artifactory"
###docker run --name artifactory -w $JFROG_HOME/artifactory/var/ -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-<pro|oss|cpp-ce>:latest
docker run --name artifactory -w $JFROG_HOME/artifactory/var/ -v $JFROG_HOME/artifactory/var/:/var/opt/jfrog/artifactory -d -p 8081:8081 -p 8082:8082 docker.bintray.io/jfrog/artifactory-cpp-ce:latest