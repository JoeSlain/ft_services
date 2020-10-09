FROM alpine

LABEL maintainer="jcueille@student.42.fr"

WORKDIR /tmp

EXPOSE 5050
RUN echo http://pkg.example.com/alpine/v3.11/community >> /etc/apk/repositories
RUN apk update
RUN apk add openssl
RUN apk add supervisor
RUN apk add openrc --no-cache
RUN apk add nginx php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /wwwi
RUN mkdir -p /usr/share/webapps/
RUN cd /usr/share/webapps/
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz
RUN rm latest.tar.gz
RUN chown -R www /usr/share/webapps/
RUN ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
RUN RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt \
    -subj "/C=FR/ST=PARIS/L=PARIS/O=42/OU=STUDENT/CN=jcueille"
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /tmp

ENTRYPOINT ./entrypoint.sh
