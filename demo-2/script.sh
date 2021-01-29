#!/bin/bash
# install nginx
sudo yum update -y
sudo yum install httpd -y

# make sure nginx is started
systemctl start httpd
