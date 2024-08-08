STOWDIR=$(CURDIR)/

include .build/makefile/distro/$(shell . .build/script/which-os.sh).makefile
include .build/makefile/plugin.makefile
include .build/makefile/rust.makefile
include .build/makefile/python.makefile

.PHONY: all headless extra bat conda docker fastfetch git htop nvim tmux wezterm yazi zsh

all: headless extra wezterm

headless: git zsh tmux nvim yazi

extra: conda docker man bat fastfetch htop

bat: $(CARGOBINDIR)bat

conda: $(BINDIR)stow $(CONDABINDIR)conda
	@echo "Installing conda configuration"

	cd $(STOWDIR) && stow conda --target ~/

# docker-compose is dependent on docker, so the package manager will install it
docker: $(BINDIR)docker-compose

fastfetch: $(BINDIR)fastfetch $(BINDIR)htop $(BINDIR)stow
	@echo "Installing fastfech configuration"
	
	cd $(STOWDIR) && stow fastfetch --target ~/

git: $(BINDIR)gh $(BINDIR)git-lfs $(BINDIR)stow
	@echo "Installing git configuration"

	cd $(STOWDIR) && stow git --target ~/

htop: $(BINDIR)htop $(BINDIR) $(BINDIR)stow
	@echo "Installing htop configuration"

	cd $(STOWDIR) && stow htop --target ~/

nvim: $(BINDIR)cc $(BINDIR)luajit $(BINDIR)luarocks $(BINDIR)magick $(BINDIR)nvim $(BINDIR)stow $(PYTHONDIR)pynvim
	@echo "Installing nvim configuration"

	# magick bindings for 3rd/image.nvim
	luarocks install --local magick

	cd $(STOWDIR) && stow nvim --target ~/
	nvim --headless "+Lazy! sync" +qa

# TODO: Ubuntu splits man-pages into a second manpages-dev package. Should get its own recipe
man: $(BINDIR)mandb $(LICENSEDIR)man-pages
	@echo "Installing manpages"
	
	sudo mandb

tmux: $(BINDIR)tmux $(BINDIR)stow $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux
	@echo "Installing tmux configuration"

	cd $(STOWDIR) && stow tmux --target ~/

wezterm: $(BINDIR)stow $(BINDIR)wezterm
	@echo "Installing wezterm configuration"
	
	cd $(STOWDIR) && stow wezterm --target ~/

yazi: $(BINDIR)stow $(CARGOBINDIR)yazi
	@echo "Installing yazi configuration"

	cd $(STOWDIR) && stow yazi --target ~/

zsh: $(BINDIR)curl $(CARGOBINDIR)fd $(BINDIR)fzf $(LOCALBINDIR)oh-my-posh $(CARGOBINDIR)rg $(BINDIR)stow $(BINDIR)zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
	@echo "Installing zsh configuration"

	sudo chsh -s $(shell which zsh) $(shell whoami)
	cd $(STOWDIR) && stow zsh --target ~/

