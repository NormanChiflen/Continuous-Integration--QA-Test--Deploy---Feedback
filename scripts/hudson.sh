#! /bin/bash

#$MAVEN_HOME=/var/lib/jenkins/tools/Maven_3.0.3
$MAVEN_HOME=/usr

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=commons-io -DartifactId=id -Dversion=2.0.1 -Dpackaging=jar -Dfile=./libs/commons-io-2.0.1.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=o2pm-api -DartifactId=id -Dversion=1.56 -Dpackaging=jar -Dfile=./libs/o2pm-api-1.56.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=networking -DartifactId=id -Dversion=1.24 -Dpackaging=jar -Dfile=./libs/networking-1.24-distribution.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=android-1.0 -DartifactId=id -Dversion=1.0 -Dpackaging=jar -Dfile=./libs/android-1.0.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=twitter4j-support -DartifactId=id -Dversion=2.2.4 -Dpackaging=jar -Dfile=./libs/twitter4j-media-support-android-2.2.4.jar 

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=twitter4j-stream -DartifactId=id -Dversion=2.2.4 -Dpackaging=jar -Dfile=./libs/twitter4j-stream-android-2.2.4.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=twitter4j-core -DartifactId=id -Dversion=2.2.4 -Dpackaging=jar -Dfile=./libs/twitter4j-core-android-2.2.4.jar 

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=twitter4j-async -DartifactId=id -Dversion=2.2.4 -Dpackaging=jar -Dfile=./libs/twitter4j-async-android-2.2.4.jar

$MAVEN_HOME/bin/mvn install:install-file -DgroupId=trace -DartifactId=id -Dversion=1.0 -Dpackaging=jar -Dfile=./libs/trace.jar
