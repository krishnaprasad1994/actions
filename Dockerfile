FROM amazonlinux
MAINTAINER PRReddy
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.76/bin/apache-tomcat-8.5.76.zip /opt/
RUN yum install unzip -y
RUN yum install vim -y
RUN unzip /opt/apache-tomcat-8.5.76.zip
RUN chmod +x /opt/apache-tomcat-8.5.76/bin/*
COPY ./tomcat-user.xml /opt/apache-tomcat-8.5.76/conf/
RUN amazon-linux-extras install java-openjdk11 -y
COPY ./dptweb-1.0.war /opt/apache-tomcat-8.5.76/webapps/
CMD ["/opt/apache-tomcat-8.5.76/bin/catalina.sh", "run"]
