
######################################## 
## DOWNLOAD BASE IMAGE FROM DOCKERHUB
######################################## 
FROM registry.access.redhat.com/ubi8-init:8.9-1


######################################## 
## INSTALL PYTHON
########################################
RUN  dnf install python3 -y
RUN python3 --version
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python --version
RUN which python3


######################################## 
## INSTALL UTILITIES
########################################
RUN yum install -y dos2unix unzip wget bind-utils 


######################################## 
## INSTALL AWS-CLI
######################################## 
RUN dnf install python3-pip -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o /tmp/awscliv2.zip
RUN unzip /tmp/awscliv2.zip
RUN ./aws/install
RUN ln -s /usr/local/bin/aws /bin/aws
RUN aws configure set default.s3.signature_version s3v4
RUN aws --version



######################################## 
## INSTALL UTILITIES
######################################## 
RUN yum update -y
RUN cat /etc/redhat-release

######################################## 
## CHANGE TIMEZONE
######################################## 
RUN echo "America/New_York" > /etc/timezone
RUN ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime

######################################## 
## INSTALL OPENJDK
######################################## 
#RUN yum install java-1.8.0-openjdk -y
#RUN yum install java-11-openjdk -y
#RUN yum install java-17-openjdk -y
RUN yum install java-21-openjdk -y
RUN java -version

######################################## 
## CLEANUP
######################################## 

RUN rm -rf /tmp/*
RUN rm -rf /var/log/*
RUN cat /dev/null > /root/.bash_history
RUN cat /dev/null > /root/.bash_history