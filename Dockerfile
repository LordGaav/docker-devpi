FROM python:3-slim
MAINTAINER Nick Douma <nick.douma@nekoconeko.nl>

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
