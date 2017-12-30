FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Europe/Paris

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends git tree wget less vim \
	php7.0-json php7.0-cli php7.0-zip php7.0-curl php7.0-pgsql php7.0-xml php7.0-mbstring php7.0-bcmath \
	nginx php7.0-fpm iputils-ping composer ssh xz-utils libxrender1 libxext6 php-mysql unzip postgresql-client \
	fonts-dejavu fonts-roboto tzdata \
	&& rm -rf /var/lib/apt/lists/*
RUN rm /etc/localtime && cp /usr/share/zoneinfo/$TZ /etc/localtime
RUN echo $TZ > /etc/timezone
RUN dpkg-reconfigure tzdata
RUN mkdir -p /opt/app/www;

WORKDIR /opt/app
ADD boot.sh /usr/local/bin/boot
CMD /usr/local/bin/boot
RUN mkdir /run/php; chmod 755 /run/php; chown www-data /run/php
ADD nginx.conf /etc/nginx/sites-enabled/default

WORKDIR /opt/app
EXPOSE 80

