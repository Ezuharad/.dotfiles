#!/usr/bin/env zsh

# checks the .zip_fuse_cache used by .dotfiles/zsh/.config/zsh/functions/cd for
# orphaned files, and alerts the user of any if found.

if [[ -n "$(ls $HOME/.zip_fuse_cache)" ]]; then
  echo "Files detected in $HOME/.zip_fuse_cache." 1>&2;
  echo "This indicates possible corruption of archives." 1>&2;
  echo "Please check the following files: " 1>&2;
  echo "$(ls -A $HOME/.zip_fuse_cache/)";
fi
