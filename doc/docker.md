sudo docker build -t impono .
sudo docker ps
sudo docker images
sudo docker run --name impono -p 4000:80 impono
sudo docker exec -i -t impono /bin/bash
# https://docs.docker.com/get-started/part2/#share-your-image
# sudo docker rm $(sudo docker ps -a -q)
