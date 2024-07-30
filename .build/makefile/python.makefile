# Python and conda installations
CONDADIR=$(HOME)/.miniconda/
CONDABINDIR=$(CONDADIR)bin/

$(CONDABINDIR)conda: $(BINDIR)curl
	mkdir -p $(CONDADIR)
	curl -fsSL https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh > miniconda.sh
	bash miniconda.sh -b -u -p $(CONDADIR)
	rm miniconda.sh

