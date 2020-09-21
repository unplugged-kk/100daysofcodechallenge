#!/bin/bash

#upgrading the packages

sudo apt-get update
sudo apt-get install -y curl openssh-server ca-certificates

#installing postfix

debconf-set-selections <<< "postfix postfix/mailname string gitlab-ci.asia-east1-a.c.automation-extended-infra.internal"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt-get install --assume-yes postfix
sudo /etc/init.d/postfix reload

#installing git-lab CE

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.example.com" apt-get install gitlab-ce

#reconfiguring git-lab CE

IP=`ip a|grep inet|head -3|tail -1|cut -c10-20` ; sed -i.bak "s/gitlab.example.com/$IP/g" /etc/gitlab/gitlab.rb
sudo gitlab-ctl reconfigure
