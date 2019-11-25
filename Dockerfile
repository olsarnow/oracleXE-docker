FROM oel6-base:6.5

MAINTAINER Olaf Sarnow <olaf@sarnow.no>

RUN yum install -y libaio bc

ADD "https://sarnow.no/files/oracle-database-xe-18c-1.0-1.x86_64.rpm" /tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm

RUN yum localinstall -y /tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm
