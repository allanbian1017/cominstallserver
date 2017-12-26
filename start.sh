#!/bin/bash

# Add user
/useradd.sh /config/user.list

# Start httpd service
echo "ServerName localhost" >> /etc/apache2/apache2.conf
echo "AddDefaultCharset utf-8" >> /etc/apache2/apache2.conf
service apache2 restart

# Start ftp service
touch /etc/vsftpd.userlist
service vsftpd restart

# Start telnet service
service xinetd restart

bash
