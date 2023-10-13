FROM tomcat:10.1.14-jdk11 
LABEL maintainer=”yash-sharma”
COPY target/September2021Assignment.war   $CATALINA_HOME/webapps/
EXPOSE 8080
CMD $CATALINA_HOME/bin/catalina.sh run && tail -f /opt/tomcat/logs/catalina.out
