# Warning
These dotfiles were configured to be used with a GNU Linux distribution, in my case Arch Linux. I keep this repository and these instructions for my convenience alone, and therefore **give absolutely no guarantee these will work on your machine**.

# Bootstrapping the Repo
## Base Tools
### Requirements
- [Git Version Control](https://git-scm.com/)
- [GNU Stow](https://www.gnu.org/software/stow/)

**optional**
- [Bat](https://github.com/sharkdp/bat)
- [GNU Make](https://www.gnu.org/software/make/)

for python:
- [conda](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html)
- [ruff](https://docs.astral.sh/ruff/)

### Installation
Run:
> cd ~
> git clone https://github.com/Ezuharad/dotfiles.git .dotfiles
> cd .dotfiles
> stow .

## WezTerm
### Requirements
- [WezTerm](https://wezfurlong.org/wezterm/index.html)

**optional**
- [Jetbrains Patched Nerdfonts](https://github.com/ryanoasis/nerd-fonts)

## Zsh
### Requirements
- [zsh](https://www.zsh.org/)
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

- [fzf](https://github.com/junegunn/fzf)

## Tmux
### Requirements
- [tmux](https://github.com/tmux/tmux/wiki)
- [tpm](https://github.com/tmux-plugins/tpm)

### Installation
Open a tmux prompt and press `C-s` then `I`.

## Neovim
### Requirements
- [neovim](https://neovim.io/)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fd](https://github.com/sharkdp/fd)
- [lazygit](https://github.com/jesseduffield/lazygit)
- A compiler for Treesitter, specifically one of:
    - [clang](https://clang.llvm.org/)
    - [gcc](https://gcc.gnu.org/)
    - [zig](https://ziglang.org/)

**optional**
For python:
- [pynvim](https://github.com/neovim/pynvim)
- The pyright LSP requires nodejs, which is installable through [nvm](https://github.com/nvm-sh/nvm)

### Installation
Run:
> nvim --headless "+Lazy! sync" +qa

## Yazi
### Requirements
- [Yazi](https://yazi-rs.github.io/)

# Miscellaneous
- Remap the capslock key to `esc`

