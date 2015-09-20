#!/bin/bash

sudo docker build -t python_jk -f Dockerfile_py .
sudo docker build -t ruby_jk -f Dockerfile_rb .
sudo docker build -t golang_jk -f Dockerfile_go .
sudo docker build -t haskell_jk -f Dockerfile_hs .

# export/import jenkins jobs
# java -jar jenkins-cli.jar -s http://server get-job myjob > myjob.xml
# java -jar jenkins-cli.jar -s http://server create-job newmyjob < myjob.xml
