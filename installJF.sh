#!/bin/bash
JFROG_HOME=$(pwd)
echo "Creating an artifactory in $JFROG_HOME"
mkdir -p $JFROG_HOME/artifactory/var/etc/
cd $JFROG_HOME/artifactory/var/etc/
echo "Creating system.yaml confiuration file"
touch ./system.yaml
chown -R 1030:1030 $JFROG_HOME/artifactory/var