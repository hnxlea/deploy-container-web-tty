FROM ubuntu

# Update and upgrade sources and packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y sudo bash net-tools ssh vim curl

ENV INIT_SCRIPT="/init.sh"

# Copy init.sh script
COPY . "$INIT_SCRIPT"

# Sanity check, verify file copy
RUN if [ -e "$INIT_SCRIPT" ]; then \
        echo "files copied" && \
        echo $(ls -atl); \
    fi

RUN sudo chmod 755 "$INIT_SCRIPT"

EXPOSE 80

CMD bash $INIT_SCRIPT
