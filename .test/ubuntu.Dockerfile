# syntax=docker/dockerfile:1
FROM ubuntu:latest

ENV PKGS="all"

LABEL author="Ezuharad"
LABEL version="1.0"
LABEL description="Test environment for dotfiles deploy"

ADD . /home/testuser/.dotfiles

SHELL ["/bin/bash", "-c"]

RUN ["apt", "-y", "update"]
RUN ["apt", "-y", "install", "sudo make git"]

RUN ["useradd", "-m", "testuser"]
RUN ["usermod", "-a", "-G", "sudo", "testuser"]
RUN ["chown", "-R", "testuser", "/home/testuser"]
RUN yes "null" | passwd testuser

USER testuser

WORKDIR /home/testuser
ENTRYPOINT ["bash", "-s", "$HOME/.dotfiles/init.sh", "--", "$PKGS"]

