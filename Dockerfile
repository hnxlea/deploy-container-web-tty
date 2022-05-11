FROM ubuntu

# Update and upgrade sources and packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y dbus-x11 sudo bash net-tools tasksel ssh nano curl

RUN sudo adduser user --gecos "First Last,RoomNumber,WorkPhone,HomePhone" --disabled-password
RUN echo "user:Mm0ZM1SP2QOb" | sudo chpasswd


ENV INIT_SCRIPT="/home/user/init.sh"

# Copy init.sh script
COPY . "$INIT_SCRIPT"

# Sanity check, verify file copy
RUN if [ -e "$INIT_SCRIPT" ]; then \
        echo "files copied"; \
    fi

RUN chmod +x "$INIT_SCRIPT"

EXPOSE 80

CMD /home/user/init.sh
