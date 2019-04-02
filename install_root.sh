#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/lsu_buildout/etc/nginx.conf ./sites-available/lsu.conf
cd sites-enabled
ln -s ../sites-available/lsu.conf

service nginx stop
certbot certonly --standalone -d lsu.voteit.se
service nginx start
