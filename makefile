STOWDIR=$(CURDIR)/

TMUX_SUBMODULE_PREFIX=tmux/.tmux/plugins/
ZSH_SUBMODULE_PREFIX=zsh/.zshinit/plugin/


$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm
	git submodule update $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm

$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux
	git submodule update $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme: $(BINDIR)curl
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k
	git submodule update $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting
	git submodule update $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting

include .tool/makefile.$(shell . .tool/script/which-os.sh)


.PHONY: all extra git tmux wezterm zsh

all:
	$(MAKE) git
	$(MAKE) zsh
	$(MAKE) tmux
	$(MAKE) wezterm
	$(MAKE) extra

extra: $(BINDIR)fastfetch $(BINDIR)htop $(BINDIR)stow
	@echo "Installing extras"
	
	cd $(STOWDIR) && stow fastfetch --target ~/
	cd $(STOWDIR) && stow htop --target ~/

git: $(BINDIR)stow $(BINDIR)git-lfs
	@echo "Installing git configuration"

	cd $(STOWDIR) && stow git --target ~/

nvim: $(BINDIR)nvim $(BINDIR)stow $(PYTHONDIR)pynvim
	@echo "Installing nvim configuration"

	cd $(STOWDIR) && stow nvim --target ~/
	nvim --headless "+Lazy! sync" +qa

tmux: $(BINDIR)tmux $(BINDIR)stow $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux
	@echo "Installing tmux configuration"

	cd $(STOWDIR) && stow tmux --target ~/

wezterm: $(BINDIR)stow $(BINDIR)wezterm
	@echo "Installing wezterm configuration"
	
	cd $(STOWDIR) && stow wezterm --target ~/

zsh: $(BINDIR)fzf $(BINDIR)stow $(BINDIR)tmux $(BINDIR)zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme 
	@echo "Installing zsh configuration"

	chsh -s $(shell which zsh)
	cd $(STOWDIR) && stow zsh --target ~/

