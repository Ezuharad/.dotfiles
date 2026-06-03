#!/usr/bin/env zsh

# completions
which diffsitter > /dev/null && eval "$(diffsitter gen-completion zsh)";
which docker > /dev/null && eval "$(docker completion zsh)";
which podman > /dev/null && eval "$(podman completion zsh)";
which typst > /dev/null && eval "$(typst completions zsh)";

