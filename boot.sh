#!/bin/bash
/usr/sbin/php-fpm7.0 &
/usr/sbin/nginx -g 'daemon off;'
