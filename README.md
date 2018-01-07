# 電腦硬體裝修丙級伺服器

This Docker container implements a telnet/http/ftp server, with the following features:

 * Ubuntu 16.04 base image.

### Installation from [Docker registry hub](https://registry.hub.docker.com/u/allanbian/cominstallserver/).

You can download the image with the following command:

```bash
docker pull allanbian/cominstallserver
```

----

Exposed ports and volumes
----

The image exposes ports `20`, `21`, `23` and `80`. Also, exports two volumes: `/home/`, which contains users home directories, and `/config/`, used to store user list.

Environment variables
----

* Variable name: `HOST_IP`
* Default value: 127.0.0.1
* Accepted values: Any IPv4 address.
* Description: If you don't specify an IP address to be used in passive mode, the lo address will be used.

----

* Variable name: `PASV_MIN_PORT`
* Default value: 21100.
* Accepted values: Any valid port number.
* Description: This will be used as the lower bound of the passive mode port range. Remember to publish your ports with `docker -p` parameter.

----

* Variable name: `PASV_MAX_PORT`
* Default value: 21110.
* Accepted values: Any valid port number.
* Description: This will be used as the upper bound of the passive mode port range. It will take longer to start a container with a high number of published ports.

----

Use cases
----

Users in `config/user.list` will automatically added in docker when container start to run.

`user.list` format:
```
username:password
username:password
```

1) Create a temporary container for testing purposes:

```bash
  docker run --rm -it \
	-p 21100-21110:21100-21110 \
	-p 80:80 -p 21:21 -p 20:20 -p 23:23 \
	-v $PWD/config/:/config/ \
	-v $PWD/home/:/home/ \
	allanbian/cominstallserver
```

2) Create a container in active mode:

```bash
docker run -d \
	-p 21100-21110:21100-21110 \
	-p 80:80 -p 21:21 -p 20:20 -p 23:23 \
	-v $PWD/config/:/config/ \
	-v $PWD/home/:/home/ \
    --name cominstallserver \
	allanbian/cominstallserver
```
