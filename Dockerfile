FROM rmkn/centos8
LABEL maintainer "rmkn"

RUN rpm -Uvh http://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el8.noarch.rpm
RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-litespeed
RUN yum -y install openlitespeed lsphp73 lsphp73-common lsphp73-mysqlnd lsphp73-gd lsphp73-process lsphp73-mbstring lsphp73-xml lsphp73-mcrypt lsphp73-pdo lsphp73-imap lsphp73-soap lsphp73-bcmath
RUN ln -sf /usr/local/lsws/lsphp73/bin/lsphp /usr/local/lsws/fcgi-bin/lsphp5

EXPOSE 8088 7080

CMD ["/usr/local/lsws/bin/litespeed", "-d"]
