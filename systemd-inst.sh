#!/bin/bash
ln -s `pwd`/docker-compose-app.service /etc/systemd/system/docker-compose-app.service
systemctl daemon-reload
systemctl enable docker-compose-app
systemctl status docker-compose-app
