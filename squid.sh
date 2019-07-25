#!/bin/bash



mkdir -p /srv/squid/{etc,cache,log}

cp /srv/squid/etc/* ./root/etc/squid/
tar -cf ../squid-container.tar ../squid-container

podman build -t squid:latest .

podman rm -f squid
podman run --name squid -d \
	-p 3128:3128 \
	-p 3129:3129 \
	-v /srv/squid/etc:/etc/squid:Z \
	-v /srv/squid/cache:/var/spool/squid:Z \
	-v /srv/squid/log:/var/log/squid:Z \
	squid:latest

