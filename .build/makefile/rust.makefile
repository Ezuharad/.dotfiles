# Cargo packages
CARGOBINDIR=$(HOME)/.cargo/bin/


$(CARGOBINDIR)bat: $(CARGOBINDIR)cargo
	cargo install --locked bat

$(CARGOBINDIR)cargo: $(BINDIR)curl
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
	# Because each command is in its own shell sourcing ~/.cargo/bin/env will not work
	$(CARGOBINDIR)rustup update

$(CARGOBINDIR)fd: $(CARGOBINDIR)cargo $(BINDIR)cc
	cargo install --locked fd-find

$(CARGOBINDIR)fzf: $(CARGOBINDIR)cargo
	cargo install --locked fzf

$(CARGOBINDIR)rg: $(CARGOBINDIR)cargo
	cargo install --locked ripgrep

$(CARGOBINDIR)yazi: $(CARGOBINDIR)cargo
	cargo install --locked yazi-fm yazi-cli

