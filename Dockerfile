FROM oraclelinux:latest

MAINTAINER Olaf Sarnow <olaf@sarnow.no>

RUN yum install -y libaio bc wget


RUN wget -O /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm "https://sarnow.no/files/oracle-database-xe-18c-1.0-1.x86_64.rpm"

RUN yum localinstall -y /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm
