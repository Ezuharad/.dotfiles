# zsh and tmux plugins
TMUX_SUBMODULE_PREFIX=tmux/.tmux/plugins/
ZSH_SUBMODULE_PREFIX=.config/zsh/plugin/

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

$(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fzf-tab/fast-syntax-highlighting.plugin:
	git submodule init $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fzf-tab
	git submodule update $(STOWDIR)$(ZSH_SUBMODULE_PREFIX)fzf-tab

