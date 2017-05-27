# Apache 2.4.10 sur Red Hat 
#
# VERSION               0.0.1
#

FROM     fedora:latest
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"
ENV password_ssh="docker"

# Ajout utilisateur "${login_ssh}"
RUN useradd docker -p WIcpSebTtMFGw -s /bin/bash -d /home/docker 

# Modification du mot de passe root
RUN echo "root:docker" | chpasswd

# installation paquet
# RUN yum install wget

# Ports
EXPOSE 22 80

USER docker

WORKDIR /home/docker
