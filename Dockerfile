FROM tomcat:latest 
LABEL maintainer=”yash-sharma”
COPY target/September2021Assignment.war  /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
