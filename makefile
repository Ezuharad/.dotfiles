STOWDIR=$(CURDIR)/

include .build/makefile/distro/$(shell . .build/script/which-os.sh).makefile
include .build/makefile/plugin.makefile
include .build/makefile/rust.makefile
include .build/makefile/python.makefile

.PHONY: all headless extra bat conda fastfetch git htop nvim tmux wezterm yazi zsh

all:
	$(MAKE) headless
	$(MAKE) extra
	$(MAKE) wezterm

headless:
	$(MAKE) git
	$(MAKE) zsh
	$(MAKE) tmux
	$(MAKE) nvim
	$(MAKE) yazi

extra:
	$(MAKE) bat
	$(MAKE) conda
	$(MAKE) fastfetch
	$(MAKE) htop
	$(MAKE) man

bat: $(CARGOBINDIR)bat

conda: $(BINDIR)stow $(CONDABINDIR)conda
	@echo "Installing conda configuration"

	cd $(STOWDIR) && stow conda --target ~/

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

man: $(BINDIR)man-db

tmux: $(BINDIR)tmux $(BINDIR)stow $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux
	@echo "Installing tmux configuration"

	cd $(STOWDIR) && stow tmux --target ~/

wezterm: $(BINDIR)stow $(BINDIR)wezterm
	@echo "Installing wezterm configuration"
	
	cd $(STOWDIR) && stow wezterm --target ~/

yazi: $(BINDIR)stow $(CARGOBINDIR)yazi
	@echo "Installing yazi configuration"

	cd $(STOWDIR) && stow yazi --target ~/

zsh: $(BINDIR)curl $(CARGOBINDIR)fd $(BINDIR)fzf $(CARGOBINDIR)rg $(BINDIR)stow $(BINDIR)zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme
	@echo "Installing zsh configuration"

	sudo chsh -s $(shell which zsh) $(shell whoami)
	cd $(STOWDIR) && stow zsh --target ~/

