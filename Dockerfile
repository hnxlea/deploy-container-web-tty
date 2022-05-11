FROM ubuntu

# Update and upgrade sources and packages
RUN apt-get update && apt-get upgrade -y

# Copy init.sh script
COPY init.sh /

RUN chmod +x /init.sh

EXPOSE 80

CMD bash /init/init.sh
