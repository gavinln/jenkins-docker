#!/bin/bash

JK_GET_JOB="java -jar jenkins-cli.jar -s http://localhost:8080 get-job"

$JK_GET_JOB ruby-hello > ruby-hello.xml 
$JK_GET_JOB python-hello > python-hello.xml 
$JK_GET_JOB haskell-hello > haskell-hello.xml 
$JK_GET_JOB golang-hello > golang-hello.xml 
$JK_GET_JOB java-hello > java-hello.xml 
