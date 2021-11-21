#Stop all containers
docker stop (docker ps -aq)

#Remove all containers
docker rm (docker ps -aq)

#Remove all container images (!! DO NOT RUN THIS DURING THE LAB !!)
docker rmi (docker ps -aq)

