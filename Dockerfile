FROM ubuntu

# Update and upgrade sources and packages
RUN apt-get update && apt-get upgrade -y

COPY ./deploy-docker-compose.sh ./deploy-docker-compose.sh

EXPOSE 80

RUN chmod +x ./deploy-docker-compose.sh

CMD ["bash -c ./deploy-docker-compose.sh"]
