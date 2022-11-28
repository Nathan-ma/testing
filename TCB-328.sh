#!/bin/bash

sudo snap install docker -y
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world
sudo snap remove docker -y
sudo apt install docker.io -y
docker run hello-world
sudo apt install curl -y

rm -rf TCB-328
mkdir TCB-328
cd TCB-328

wget https://raw.githubusercontent.com/toradex/tcb-env-setup/master/tcb-env-setup.sh
source tcb-env-setup.sh
cat > docker-compose.yml <<EOF
version: '2.4'
services:
  hello:
    image: hello-world
EOF

cd ..
