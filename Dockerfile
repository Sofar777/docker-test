FROM node
RUN mkdir -p /home/docker-test
WORKDIR /home/docker-test
COPY . /home/docker-test
RUN npm install && npm install -g pm2
EXPOSE 3000
CMD pm2 start bin/www --no-daemon
