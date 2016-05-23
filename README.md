#####Check the status of processes in applications of containers from nrpe-server container.

### docker-nrpe-server
Start nrpe server:    
```docker run -d --name nrpe-server -p 5666:5666 --net=host mureevms/docker-nrpe-server```

Заменить ключи id_rsa и id_rsa.pub для доступа контейнера на хост систему по SSH. Заменить `allowed_hosts=x.x.x.x` на IP Nagios сервера в `volumes/nrpe.cfg`.

Пример кастомной проверки находится в файле `check_example.sh`, которая назначается в файле конфигурации `volumes/nrpe.cfg`

Принцип работы:   
```command[check_example]=ssh root@127.0.0.1 docker exec -i example_container /etc/nagios/check_example.sh```
Контейнер nrpe-server коннектится к хост системе, используя SSH ключи из volumes. Затем заходит в контейнер с приложением (example_container) и запускает в нем скрипт проверки `/etc/nagios/check_example.sh`. При этом, скрипты проверок должны быть добавлены в контейнеры, который надо мониторить. На стороне Nagios сервера проверка вызывается командой `check_example`.
