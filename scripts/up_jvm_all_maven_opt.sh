#JENKINS_JAVA_OPTIONS jenkins jvm heap size 2048m (-Xmx2048m when starting java
#JVM Opts:-Xmx512m -XX:MaxPermSize=256m, Java Memory settings can be – Xmx128m, -Xmx256m, -Xmx512m, -Xmx764m -Xmx1024m AND XMX2048 to mention only a few.
#Use jstack of the JDK to get all the stack- traces and then find the problematic stack. 
#Given that the memory grows very fast, I think that a particular http request is the cause of the issue. 
#global java opts: -Xms8g -Xmx8g -XX:MaxPermSize=512M -XX:+UseParallelOldGC -XX:ParallelGCThreads=4 
#screenshot of the monitoring tool on the Jenkins server:http://localhost:8080/monitoring
#https://wiki.jenkins-ci.org/display/JENKINS/Change+JVM+Options+in+all+Maven+tasks+of+Freestyle+Jobs:

import hudson.model.*
import hudson.maven.*
import hudson.tasks.*

def newJvmOptions="-Xshare:auto -Xms64m -Xmx512m -XX:MaxPermSize=256M"

// For each project
for(item in Hudson.instance.items) {
  if(item instanceof FreeStyleProject) {
    println("JOB : "+item.name);
    // Find current recipients defined in project
    println(">FREESTYLE PROJECT");
    for (builder in item.builders){
      println(">> "+builder);
      if (builder instanceof Maven) {
        println(">>MAVEN BUILDER");
        println(">>TARGETS : "+builder.targets);
        println(">>NAME : "+builder.mavenName);
        println(">>POM : "+builder.pom);
        // .properties is overridden by groovy
        println(">>PROPERTIES : "+builder.@properties);
        println(">>JVM-OPTIONS : "+builder.jvmOptions);
        println(">>USE PRIVATE REPO : "+builder.usePrivateRepository);
        def newBuilder = new Maven(builder.targets,builder.mavenName,builder.pom,builder.@properties,newJvmOptions,builder.usePrivateRepository);
        item.buildersList.replace(newBuilder);
      }
    }
    println("\n=======\n");
  }
}
 
