#!/bin/sh 

# Docker
sudo apt-get update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo apt install -y docker.io
sudo systemctl start docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5

# Docker Compose`
sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"
sudo chmod +x /usr/local/bin/docker-compose
sudo wget --output-document=/etc/bash_completion.d/docker-compose "https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
printf '\nDocker Compose installed successfully\n\n'

mkdir project && cd project
git clone https://github.com/lironham/Flask_s3.git
cd Flask_s3
cp ../../.env .
docker-compose up -d --build
#test application
curl localhost/file
