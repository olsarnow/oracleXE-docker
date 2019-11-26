FROM oraclelinux:latest

MAINTAINER Olaf Sarnow <olaf@sarnow.no>

RUN yum install -y libaio bc wget


RUN wget -O /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm "https://sarnow.no/files/oracle-database-xe-18c-1.0-1.x86_64.rpm"

RUN yum localinstall -y /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm

RUN rm -fr /var/tmp/oracle-database-xe-18c-1.0-1.x86_64.rpm

ADD init.ora /opt/oracle/product/18c/dbhomeXE/config/scripts/init.ora
ADD initXETemp.ora /opt/oracle/product/18c/dbhomeXE/config/scripts/initXETemp.ora
ADD xe.rsp /tmp/xe.rsp

RUN mkdir /opt/oradata
RUN chown -R oracle:dba /opt/oracle

RUN mkdir /opt/orarecovery ; chown oracle:dba /opt/orarecovery


RUN (echo "oracle"; echo "oracle";) | /etc/init.d/oracle-xe-18c configure responseFile=/tmp/xe.rsp

# Create entries for the database in the profile
RUN echo 'export ORACLE_HOME=/opt/oracle/product/18c/dbhomeXE' >> /etc/profile.d/oracle_profile.sh
RUN echo 'export PATH=$ORACLE_HOME/bin:$PATH' >> /etc/profile.d/oracle_profile.sh
RUN echo 'export ORACLE_SID=XE' >> /etc/profile.d/oracle_profile.sh

RUN echo "root:oracle" | chpasswd
RUN echo "oracle:oracler" | chpasswd

EXPOSE 1521
EXPOSE 8080

CMD sed -i -E "s/HOST = [^)]+/HOST = $HOSTNAME/g" /opt/oracle/product/18c/dbhomeXE/network/admin/listener.ora

CMD systemctl start oracle-xe-18c
