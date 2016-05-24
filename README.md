#####Check the status of the processes in application containers from nrpe-server container.

Start nrpe server:    
```
docker run -d --name nrpe-server -p 5666:5666 --net=host mureevms/docker-nrpe-server
```

Replace id_rsa and id_rsa.pub keys to provide access for the container to the host system via SSH. Replace `allowed_hosts=x.x.x.x` with IP of Nagios server in `volumes/nrpe.cfg`.

Example of custom check is located in the file called `check_example.sh`, which could be assigned in the configuration file `volumes/nrpe.cfg`

Principle of operation:
```
command[check_example]=ssh root@127.0.0.1 docker exec -i example_container /etc/nagios/check_example.sh
```
Nrpe-server container connects to host system, using SSH keys from volumes, after taht goes to application container (example_container) and runs check script `/etc/nagios/check_example.sh`. At the same time, check scripts must be added to the containers, which you want to monitor. To run the check on the Nagios-server side use command `check_example`.
