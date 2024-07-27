STOWDIR=~/.dotfiles/

TMUX_SUBMODULE_PREFIX=tmux/.tmux/plugins/
ZSH_SUBMODULE_PREFIX=zsh/.zshinit/plugin/


$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm

$(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux:
	git submodule init $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting

include .tool/makefile.$(shell . .tool/script/which-os.sh)


.PHONY: tmux zsh

tmux: $(BINDIR)tmux $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tpm/tpm $(STOWDIR)$(TMUX_SUBMODULE_PREFIX)tmux/nord.tmux
	cd $(STOWDIR) && stow tmux
	tmux source ~/.tmux.conf

zsh: $(BINDIR)zsh $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)powerlevel10k/powerlevel10k.zsh-theme $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh $(BINDIR)stow $(BINDIR)fzf
	chsh -s $(shell which zsh)
	cd $(STOWDIR) && stow zsh

