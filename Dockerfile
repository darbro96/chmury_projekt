#FROM openjdk:8u191-jdk-alpine3.9
#ADD target/pralki3-0.0.1-SNAPSHOT.jar .
#EXPOSE 8000
#CMD java -jar pralki3-0.0.1-SNAPSHOT.jar --envname=prod

#FROM openjdk:8-jdk-alpine
#EXPOSE 8080
#ARG JAR_FILE=target/pralki3-0.0.1-SNAPSHOT.jar
#ADD ${JAR_FILE} app.jar
#ENTRYPOINT ["java","-jar","/app.jar"]

# we are extending everything from tomcat:8.0 image ...
#FROM tomcat:8.0
#MAINTAINER Darek
# COPY path-to-your-application-war path-to-webapps-in-docker-tomcat
#COPY target/pralki3-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

FROM tomcat:9.0.24
VOLUME /tmp
COPY target/pralki3-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/docker-springboot.war
EXPOSE 8086
ENTRYPOINT [ "sh", "-c", "java -Dspring.profiles.active=docker -Djava.security.egd=file:/dev/./urandom -jar /usr/local/tomcat/webapps/docker-springboot.war" ]
