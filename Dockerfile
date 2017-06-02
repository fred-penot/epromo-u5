# Apache 2.4.10 sur Fedora 
#
# VERSION               0.0.1
#

FROM     fedora:latest
MAINTAINER Fwedoz "fwedoz@gmail.com"

# Definition des constantes
ENV login_ssh="docker"
ENV password_ssh="docker"

# Mise a jour des depots
RUN dnf repolist all

# Mise a jour systeme
RUN dnf update

# Installation du serveur SSH et de wget
RUN dnf install openssh-server.x86_64 htop grep procps-ng

# Ajout utilisateur "${login_ssh}"
RUN useradd docker -p PKm7oZRGZQbwY -s /bin/bash -d /home/docker 

# Modification du mot de passe root
RUN echo "root:docker" | chpasswd

# lancement de ssh a chaque demarrage
RUN systemctl enable sshd.service

# Ports
EXPOSE 22 80

USER docker

WORKDIR /home/docker
