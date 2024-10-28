# source lesspipe
(which lesspipe.sh > /dev/null && lesspipe.sh | source /dev/stdin) || (which lesspipe > /dev/null && lesspipe | source /dev/stdin)
which bat > /dev/null && LESSCOLORIZER='bat --style=plain --theme=Nord'

