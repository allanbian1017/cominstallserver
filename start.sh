#!/bin/bash

# Check enviroment variable
if [ -z $HOST_IP ]; then
  HOST_IP="127.0.0.1"
fi

if [ -z $PASV_MAX_PORT]; then
  PASV_MAX_PORT=21110
fi

if [ -z $PASV_MIN_PORT]; then
  PASV_MIN_PORT=21100
fi

# Add user
/useradd.sh /config/user.list

# Start httpd service
echo "ServerName ${HOST_IP}" >> /etc/apache2/apache2.conf
echo "AddDefaultCharset utf-8" >> /etc/apache2/apache2.conf
service apache2 restart

# Start ftp service
echo "pasv_address=${HOST_IP}" >> /etc/vsftpd.conf
echo "pasv_max_port=${PASV_MAX_PORT}" >> /etc/vsftpd.conf
echo "pasv_min_port=${PASV_MIN_PORT}" >> /etc/vsftpd.conf

touch /etc/vsftpd.userlist
service vsftpd restart

# Start telnet service
service xinetd restart

bash
