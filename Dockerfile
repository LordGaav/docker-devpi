FROM python:3-slim
MAINTAINER Nick Douma <nick.douma@nekoconeko.nl>

# We need Git to install some dependencies
RUN apt-get update -qy \
 && apt-get install -qy --no-install-recommends git \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install devpi and dependencies
COPY devpi-requirements.txt /
RUN pip install -r /devpi-requirements.txt

# Set default server root
ENV DEVPI_SERVER_ROOT=/devpi

# Add entrypoint
COPY devpi-client /usr/local/bin/
COPY entrypoint.sh /
ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
EXPOSE 3141
