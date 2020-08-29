#!/bin/sh

sudo amazon-linux-extras enable nginx1.12
sudo yum -y install nginx
sudo service nginx start
sudo service nginx status
