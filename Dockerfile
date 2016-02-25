FROM debian:jessie

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

RUN apt-get update && apt-get -y -qq install nginx nano vim

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /etc/nginx/sites-enabled
VOLUME /var/www

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]





