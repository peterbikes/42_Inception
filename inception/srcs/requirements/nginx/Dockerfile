FROM debian:bullseye

EXPOSE 443

ARG CERTIFICATE
ARG CERTIFICATE_KEY

RUN apt update -y
RUN apt upgrade -y

RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN apt install gettext-base -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out ${CERTIFICATE} -keyout ${CERTIFICATE_KEY} \
			-subj "/C=PT/ST=OPO/L=Porto/O=42/OU=42/CN=psotto-m.42.fr/UID=psotto-m"

COPY conf/nginx.conf /tmp
COPY files/very-basic-html.html /var/www/html/static/very-basic-html.html

RUN envsubst '${CERTIFICATE},${CERTIFICATE_KEY}' < /tmp/nginx.conf > /etc/nginx/nginx.conf

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
