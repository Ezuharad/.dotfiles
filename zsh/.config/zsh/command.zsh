# custom commands
for file in $HOME/.config/zsh/function/*; do
  func_name=$(basename $file)
  autoload -Uz $func_name
done
