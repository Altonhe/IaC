#!/bin/bash
# install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

cd /home/${user}

# clone repo
git clone https://github.com/altonhe/onebusaway-docker.git

cd /home/${user}/onebusaway-docker

# create docker-compose.prod.yml
echo "${docker_compose}" > docker-compose.prod.yml

# create .env file
echo "${docker_env}" > .env

# start Docker Compose
docker-compose -f docker-compose.prod.yml up -d
