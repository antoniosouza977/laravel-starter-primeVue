FROM node:latest

WORKDIR /var/www

# Copie o código fonte da aplicação Laravel para o contêiner
COPY . /var/www
COPY ./docker/node/start.sh /usr/local/bin/start
RUN chmod u+x /usr/local/bin/start

ENTRYPOINT ["/usr/local/bin/start"]
