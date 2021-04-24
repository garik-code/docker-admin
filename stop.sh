#!/bin/sh
clear
cd dockprom
docker-compose down
cd ..
clear
docker stop portainer
clear
echo '
Docker admin down
'
