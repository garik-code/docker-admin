#!/bin/sh
clear
echo 'Welcome install admin'
echo '
Enter password:
'
read password
clear
echo '

Generate password hash...

'
docker run --rm caddy caddy hash-password --plaintext $password
echo '
Copy and enter password hash:
'
read passwordhash
clear
echo $passwordhash
git clone https://github.com/garik-code/dockprom
cd dockprom
ADMIN_USER=admin ADMIN_PASSWORD=$password ADMIN_PASSWORD_HASH=$passwordhash docker-compose up -d
clear
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
clear
echo '
Docker admin launch
'
