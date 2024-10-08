# syntax=docker/dockerfile:1
FROM ubuntu:latest

ENV PKGS="all"

LABEL author="ezuharad"
LABEL version="1.0"
LABEL description="test environment for dotfiles deploy"

SHELL ["/bin/bash", "-c"]

RUN ["apt", "-y", "update"]
RUN ["apt", "-y", "install", "sudo", "make", "git"]

RUN ["useradd", "-m", "testuser"]
RUN ["usermod", "-a", "-G", "sudo", "testuser"]

ADD . /home/testuser/.dotfiles

RUN ["chown", "-R", "testuser", "/home/testuser"]
RUN yes "null" | passwd testuser

USER testuser

WORKDIR /home/testuser
ENTRYPOINT ["bash", "-s", "$home/.dotfiles/init.sh", "--", "$PKGS"]

