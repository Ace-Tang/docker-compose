#!/bin/bash
#arg=`docker -v| awk '{print $2}'`
#if [ "$arg" == "version" ];then
cat > /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum install -y docker-engine
service docker start
echo -n "install docker complete! "
docker -v
sleep 3
#fi

#arg=`docker-compose -v| awk '{print $2}'`
#if [ "$arg" == "version" ];then

curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo -n "install docker-compose complete!"
docker-compose -v
#fi
