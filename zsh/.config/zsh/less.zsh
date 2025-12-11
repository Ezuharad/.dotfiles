#!/usr/bin/env zsh

# use `bat` over `less`, and enable lesspipe integrations

(which lesspipe.sh > /dev/null && lesspipe.sh | source /dev/stdin) || (which lesspipe > /dev/null && lesspipe | source /dev/stdin);
which bat > /dev/null && LESSCOLORIZER='bat --style=plain --theme=Nord';

