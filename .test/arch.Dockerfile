# syntax=docker/dockerfile:1
FROM archlinux:latest

ENV PKGS="all"

LABEL author="ezuharad"
LABEL version="1.0"
LABEL description="test environment for dotfiles deploy"

SHELL ["/bin/bash", "-c"]

RUN ["pacman", "-Syu", "--noconfirm"]
RUN ["pacman", "-S", "--noconfirm", "sudo", "make", "git"]
RUN echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

RUN ["useradd", "-m", "testuser"]
RUN ["usermod", "-a", "-G", "wheel", "testuser"]

ADD . /home/testuser/.dotfiles

RUN ["chown", "-R", "testuser", "/home/testuser"]
RUN yes "null" | passwd testuser

USER testuser
RUN yes "null" | sudo -S echo

WORKDIR /home/testuser
ENTRYPOINT ["bash", "-s", "$home/.dotfiles/init.sh", "--", "$PKGS"]

