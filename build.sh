#!/bin/bash

cd webapp
mvn package
cp target/gs-spring-boot-0.1.0.jar ../www/webapp.jar
