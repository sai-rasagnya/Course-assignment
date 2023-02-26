#!/bin/bash
timestamp=$(date '+%d%m%Y-%H%M%S')
myname=Rasagnya
s3_bucket=upgrad-rasagnya

sudo tar -cvf ${myname}-httpd-logs-${timestamp}.tar -C /tmp/  apache2/
aws s3 \
cp ${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar

if [[ ! -e /Scripts/file.txt ]]; then
    mkdir -p /var/www/html/
        touch /var/www/html/inventory.html
fi

size=$(du -sh ${myname}-httpd-logs-${timestamp}.tar | awk '{ print $1 }')
echo "httpd-logs ${timestamp} tar  $size" >> /var/www/html/inventory.htmlv
