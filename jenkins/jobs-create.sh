#!/bin/bash

JK_CREATE_JOB="java -jar jenkins-cli.jar -s http://localhost:8080 create-job"

$JK_CREATE_JOB ruby-hello < ruby-hello.xml
$JK_CREATE_JOB python-hello < python-hello.xml
$JK_CREATE_JOB haskell-hello < haskell-hello.xml
$JK_CREATE_JOB golang-hello < golang-hello.xml
$JK_CREATE_JOB java-hello < java-hello.xml
