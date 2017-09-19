FROM genee/gini:latest
MAINTAINER PiHiZi <pihizi@msn.com>

ADD oci8.so /usr/lib/php5/20131226/oci8.so
RUN echo "extension=oci8.so" > /etc/php5/mods-available/oci8.ini
RUN php5enmod oci8

ADD oracle-instantclient11.2-basiclite-11.2.0.4.0-1.x86_64.rpm /tmp/oracle.rpm
RUN apt-get install -y alien libaio1
RUN alien -i /tmp/oracle.rpm

EXPOSE 9000

CMD ["/start"]
