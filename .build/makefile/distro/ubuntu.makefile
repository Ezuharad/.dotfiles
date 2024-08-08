# Ubuntu Linux package installations
BINDIR=/usr/bin/
LICENSEDIR=/usr/share/licenses/
PYTHONDIR=/usr/lib/python3/dist-packages/

$(BINDIR)add-apt-repository:
	sudo apt install -y software-properties-common

$(BINDIR)cc:
	sudo apt install -y build-essential

$(BINDIR)clang:
	sudo apt install -y clang

$(BINDIR)curl:
	sudo apt install -y curl

$(BINDIR)docker:
	sudo apt install -y docker

$(BINDIR)docker-compose:
	sudo apt install -y docker-compose-v2

$(BINDIR)fastfetch: $(BINDIR)add-apt-repository
	sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
	sudo apt install -y fastfetch

$(BINDIR)fd:
	sudo apt install -y fd-find

$(BINDIR)fzf:
	sudo apt install -y fzf

$(BINDIR)gh:
	sudo apt install -y gh

$(BINDIR)git-lfs:
	sudo apt install -y git-lfs

$(BINDIR)htop:
	sudo apt install -y htop

$(BINDIR)luajit:
	sudo apt install -y luajit

$(BINDIR)luarocks:
	sudo apt install -y luarocks

$(BINDIR)magick:
	sudo apt install -y libmagickwand-dev

$(BINDIR)mandb:
	sudo apt install -y man-db

$(LICENSEDIR)man-pages:
	sudo apt install -y manpages
	
$(BINDIR)oh-my-posh: $(BINDIR)curl
	curl -s https://ohmyposh.dev/install.sh | bash -s

$(BINDIR)rg:
	sudo apt install -y ripgrep

$(BINDIR)nvim: $(BINDIR)add-apt-repository
	sudo add-apt-repository -y ppa:neovim-ppa/unstable

	sudo apt install -y neovim

$(BINDIR)pip:
	sudo apt install -y pip

$(BINDIR)python3:
	sudo apt install -y python3

$(BINDIR)tar:
	sudo apt install -y tar

$(BINDIR)tmux:
	sudo apt install -y tmux

$(BINDIR)snap:
	sudo apt install -y snapd

$(BINDIR)stow:
	sudo apt install -y stow

$(BINDIR)wezterm:
	curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
	echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

	sudo apt install -y wezterm

$(BINDIR)wget:
	sudo apt install -y wget

$(BINDIR)zsh:
	sudo apt install -y zsh

$(PYTHONDIR)pynvim:
	sudo apt install -y python3-pynvim

