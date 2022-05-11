FROM ubuntu

# Update and upgrade sources and packages
RUN apt-get update && apt-get upgrade -y

# Copy init.sh script
ENV INIT_SCRIPT="~/init.sh"
COPY init.sh "$INIT_SCRIPT"

EXPOSE 80

RUN chmod +x /init.sh

CMD ["bash $INIT_SCRIPT"]
