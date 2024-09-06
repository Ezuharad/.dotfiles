# Arch Linux package installations
BINDIR=/usr/bin/
LICENSEDIR=/usr/share/licenses/
LOCALBINDIR=/usr/bin  # AUR packages almost always install to /usr/bin
PYTHONDIR=/usr/lib/python3.12/site-packages/

$(BINDIR)cc:
	sudo pacman -S --noconfirm gcc

$(BINDIR)clang:
	sudo pacman -S --noconfirm clang

$(BINDIR)curl:
	sudo pacman -S --noconfirm curl

$(BINDIR)docker:
	sudo pacman -S --noconfirm docker

$(BINDIR)docker-compose:
	sudo pacman -S --noconfirm docker-compose

$(BINDIR)fastfetch:
	sudo pacman -S --noconfirm fastfetch

$(BINDIR)fd:
	sudo pacman -S --noconfirm fd

$(BINDIR)fzf:
	sudo pacman -S --noconfirm fzf

$(BINDIR)gh:
	sudo pacman -S --noconfirm github-cli

$(BINDIR)git-lfs:
	sudo pacman -S --noconfirm git-lfs

$(BINDIR)htop:
	sudo pacman -S --noconfirm htop

$(BINDIR)lazygit:
	sudo pacman -S --noconfirm lazygit

$(BINDIR)luarocks:
	sudo pacman -S --noconfirm luarocks

$(BINDIR)luajit: $(BINDIR)paru
	paru -S --noconfirm luajit

$(BINDIR)magick:
	sudo pacman -S --noconfirm imagemagick

$(BINDIR)mandb:
	sudo pacman -S --noconfirm man-db

$(LICENSEDIR)man-pages:
	sudo pacman -S --noconfirm man-pages

$(BINDIR)nvim:
	sudo pacman -S --noconfirm neovim

$(BINDIR)nvm: $(BINDIR)paru
	paru -S --noconfirm nvm

$(LOCALBINDIR)oh-my-posh: $(BINDIR)paru
	paru -S --noconfirm oh-my-posh

$(BINDIR)paru:
	sudo pacman -S --noconfirm --needed base-devel
	cd $(STOWDIR) && mkdir .tmp/
	cd $(STOWDIR).tmp/ && git clone https://aur.archlinux.org/paru.git
	cd $(STOWDIR).tmp/paru && makepkg --noconfirm -si

	cd $(STOWDIR) && rm -rf .tmp/
	sudo pacman -Rns --noconfirm rust

$(BINDIR)pip:
	sudo pacman -S --noconfirm python-pip

$(BINDIR)python3:
	sudo pacman -S --noconfirm python

$(BINDIR)rg:
	sudo pacman -S --noconfirm ripgrep

$(BINDIR)stow:
	sudo pacman -S --noconfirm stow

$(BINDIR)tmux:
	sudo pacman -S --noconfirm tmux

$(BINDIR)wezterm:
	sudo pacman -S --noconfirm wezterm

$(BINDIR)wget:
	sudo pacman -S --noconfirm wget

$(BINDIR)zsh:
	sudo pacman -S --noconfirm zsh

$(PYTHONDIR)pynvim:
	sudo pacman -S --noconfirm python-pynvim

