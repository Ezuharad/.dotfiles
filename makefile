STOWDIR=$(CURDIR)/

include .tool/makefile/distro/makefile.$(shell . .tool/script/which-os.sh)
include .tool/makefile/makefile.plugin
include .tool/makefile/makefile.rust

.PHONY: all headless extra bat fastfetch git htop nvim tmux wezterm yazi zsh

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
	$(MAKE) htop
	$(MAKE) fastfetch

bat: $(CARGOBINDIR)bat

fastfetch: $(BINDIR)fastfetch $(BINDIR)htop $(BINDIR)stow
	@echo "Installing fastfech configuration"
	
	cd $(STOWDIR) && stow fastfetch --target ~/

git: $(BINDIR)stow $(BINDIR)git-lfs
	@echo "Installing git configuration"

	cd $(STOWDIR) && stow git --target ~/

htop: $(BINDIR)htop $(BINDIR) $(BINDIR)stow
	@echo "Installing htop configuration"

	cd $(STOWDIR) && stow htop --target ~/

nvim: $(BINDIR)clang $(BINDIR)luajit $(BINDIR)luarocks $(BINDIR)magick $(BINDIR)nvim $(BINDIR)stow $(PYTHONDIR)pynvim
	@echo "Installing nvim configuration"

	# magick bindings for 3rd/image.nvim
	luarocks install --local magick

	cd $(STOWDIR) && stow nvim --target ~/
	nvim --headless "+Lazy! sync" +qa

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

	chsh -s $(shell which zsh)
	cd $(STOWDIR) && stow zsh --target ~/

