#!/bin/sh
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
sudo apt-get install lib32stdc++6
set -xU JAVA_HOME /usr/lib/jvm/java-8-oracle/
