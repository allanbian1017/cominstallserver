FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
	vim \
	apache2 \
	vsftpd \
	xinetd \
	telnetd \
	whois \
	locales

RUN locale-gen zh_TW.UTF-8
ENV LANG zh_TW.UTF-8

COPY xinetd.conf /etc/
COPY inetd.conf /etc/
COPY vsftpd.conf /etc/
COPY useradd.sh /
COPY start.sh /

RUN mkdir -p /config/
RUN chmod +x /useradd.sh
RUN chmod +x /start.sh

VOLUME /config/
VOLUME /home/
VOLUME /var/www/html/

EXPOSE 20 21 23 80

ENTRYPOINT ["/start.sh"]
