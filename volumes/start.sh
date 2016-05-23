#!/bin/sh
sudo -u nagios ssh -o "StrictHostKeyChecking=no" root@127.0.0.1 docker exec -i agent /etc/nagios/check_docker_agent.sh
ssh -o "StrictHostKeyChecking=no" root@127.0.0.1 docker exec -i agent /etc/nagios/check_docker_agent.sh
/usr/bin/supervisord
