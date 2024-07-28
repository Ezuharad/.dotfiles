STOWDIR=$(CURDIR)/

TMUX_SUBMODULE_PREFIX=tmux/.tmux/plugins/
ZSH_SUBMODULE_PREFIX=zsh/.zshinit/plugin/


$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm
	git submodule update $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm

$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux
	git submodule update $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k
	git submodule update $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting
	git submodule update $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting


include .tool/makefile.$(shell . .tool/script/which-os.sh)


$(BINDIR)cargo: $(BINDIR)curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	rustup update

$(BINDIR)yazi: $(BINDIR)cargo
	cargo install --locked yazi-fm yazi-cli


.PHONY: all headless fastfetch git htop nvim tmux wezterm yazi zsh

all:
	$(MAKE) git
	$(MAKE) zsh
	$(MAKE) tmux
	$(MAKE) nvim
	$(MAKE) yazi
	$(MAKE) wezterm
	$(MAKE) htop
	$(MAKE) fastfetch

headless:
	$(MAKE) git
	$(MAKE) zsh
	$(MAKE) tmux
	$(MAKE) nvim
	$(MAKE) yazi
	$(MAKE) htop
	$(MAKE) fastfetch

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

yazi: $(BINDIR)stow $(BINDIR)yazi
	@echo "Installing yazi configuration"

	cd $(STOWDIR) && stow yazi --target ~/

zsh: $(BINDIR)curl $(BINDIR)fzf $(BINDIR)stow $(BINDIR)zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme 
	@echo "Installing zsh configuration"

	chsh -s $(shell which zsh)
	cd $(STOWDIR) && stow zsh --target ~/

