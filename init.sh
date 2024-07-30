#!/bin/bash
if [[ -f /etc/os-release ]]; then
  . /etc/os-release
else
  echo "Did not find /etc/os-release"
  exit 1
fi

(which git && which make) || case $ID in 
  arch )
    sudo pacman -Syu --noconfirm git make
    ;;
  ubuntu )
    sudo apt update -y
    sudo add-apt-repository -y universe
    sudo apt install -y git make
    ;;
  *)
    echo "Found unsupported distro '$ID'"
    exit 1
    ;;
esac

cd
git clone --depth=1 https://github.com/Ezuharad/.dotfiles.git
cd .dotfiles

make "$@"

