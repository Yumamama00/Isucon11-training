#!/bin/bash

# Git PULL
cd /home/isucon/webapp
git checkout main
git pull origin main

# goビルド
cd /home/isucon/webapp/go
go build

# ハードリンク貼り直し
sudo rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
cd /etc/mysql/mariadb.conf.d
sudo ln /home/isucon/webapp/configs/50-server.cnf

# サービス再起動
sudo systemctl restart nginx
sudo systemctl restart mysqld
sudo systemctl restart isucondition.go

# ログクリア
sudo truncate /var/log/mysql/mysql-slow.log --size 0
sudo truncate /var/log/nginx/access.log --size 0
