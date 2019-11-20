#!/bin/bash
yum -y install gcc openssl-devel pcre-devel php php-fpm php-mysql mariadb mariadb-server mariadb-devel
systemctl restart php-fpm
systemctl restart mariadb
tar -xf nginx-1.12.2.tar.gz
cd nginx-1.12.2
./configure 
make && make install
conf=/usr/local/nginx/conf/nginx.conf
sed -i '65,71s/#//' $conf
sed -i '70s/fastcgi_params/fastcgi.conf/' $conf
sed -i '69d' $conf
/usr/local/nginx/sbin/nginx
echo "finsh!"
