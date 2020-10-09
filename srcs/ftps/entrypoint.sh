#!/bin/sh

[ -z "$FTPS_USER" ] && FTPS_USER=admin
[ -z "$FTPS_PASS" ] && FTPS_PASS=password

adduser -D "$FTPS_USER" -h /mnt/ftp
echo "$FTPS_USER:$FTPS_PASS" | chpasswd
if [ ! -f /home/ftps/hello ]; then
	echo "hello world!" > /mnt/ftp/hello
	mkdir -p /mnt/ftp/coucou
	echo "Coucou!" > /mnt/ftp/coucou/coucoufile
fi
supervisord -c /etc/supervisord.conf
