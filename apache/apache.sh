#!/bin/bash
source /etc/apache2/envvars
rm /var/run/apache2/apache2.pid
tail -f /var/log/apache2/error.log &
exec apache2 -D FOREGROUND
echo "error_reporting = E_AL" >> /etc/php5/apache2/php.ini
echo "upload_max_filesize = 1G" >> /etc/php5/apache2/php.ini