FROM oraclelinux:latest

MAINTAINER Olaf Sarnow <olaf@sarnow.no>

RUN yum install -y libaio bc wget


RUN wget -O /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm "https://sarnow.no/files/oracle-database-xe-18c-1.0-1.x86_64.rpm"

RUN yum localinstall -y /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm

RUN rm -fr /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm

ADD init.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/init.ora
ADD initXETemp.ora /u01/app/oracle/product/11.2.0/xe/config/scripts/initXETemp.ora

RUN /etc/init.d/oracle-xe configure responseFile=/tmp/xe.rsp

# Create entries for the database in the profile
RUN echo 'export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe' >> /etc/profile.d/oracle_profile.sh
RUN echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /etc/profile.d/oracle_profile.sh
RUN echo 'export ORACLE_SID=XE' >> /etc/profile.d/oracle_profile.sh

# Change the root and oracle password to oracle
RUN echo root:oracle | chpasswd
RUN echo oracle:oracle | chpasswd

EXPOSE 1521
EXPOSE 8080

CMD sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora; \
service oracle-xe start
