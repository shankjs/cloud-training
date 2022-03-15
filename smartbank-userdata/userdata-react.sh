#!/bin/bash
sudo su
curl --silent --location https://rpm.nodesource.com/setup_14.x | sudo bash
sudo yum install -y nodejs
sudo mkdir /usr/tmp/testing
cd /usr/tmp/testing
sudo wget https://gitee.com/jijixi/react-build/repository/archive/master.zip
unzip master.zip
cd react-build-master/
sudo echo "export const API_URL = 'http://\$${lb_dns}:8080/'" > src/Constants.js
sudo npm install -g serve
sudo serve -l 80 -s build
