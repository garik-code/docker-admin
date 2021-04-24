#!/bin/sh
clear
cd dockprom
docker-compose up -d
cd ..
clear
docker start portainer
clear
echo '
Docker admin launch
'
