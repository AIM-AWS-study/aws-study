#!/bin/bash
sudo su
yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "AWS Study - Hello my name is 자기이름" > /var/www/html/index.html
