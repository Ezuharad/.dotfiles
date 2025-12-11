#!/usr/bin/env zsh

# custom commands
for file in $HOME/.config/zsh/functions/*; do
  func_name=$(basename $file);
  autoload -Uz $func_name;
done

# keybinds
zle -N zle_ls; bindkey "^F" zle_ls;
zle -N zle_fg; bindkey "^Z" zle_fg;
zle -N zle_llm; bindkey "^V" zle_llm;

