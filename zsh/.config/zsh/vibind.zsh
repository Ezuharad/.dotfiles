#!/usr/bin/env zsh

# VI-like bindings for shell

# default vi mode
bindkey -v;
bindkey "^H" backward-delete-char;
bindkey "^?" backward-delete-char;

# use bar style cursor
autoload -U cursor_mode;
cursor_mode;

# textobjects
autoload -Uz select-bracketed select-quoted;
zle -N select-quoted;
zle -N select-bracketed;
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history;
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted;
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed;
  done
done

# visurround
autoload -Uz surround;
zle -N delete-surround surround;
zle -N add-surround surround;
zle -N change-surround surround;
bindkey -M vicmd cs change-surround;
bindkey -M vicmd ds delete-surround;
bindkey -M vicmd ys add-surround;
bindkey -M visual S add-surround;
