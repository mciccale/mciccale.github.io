# Build index.html from data/ and content/ with the Ciao generator.
#
#   make          regenerate index.html
#   make clean    remove compiled generator files

CIAOC ?= ciaoc
GEN    = gen/gensite
DATA   = $(wildcard data/*.pl)
FRAGS  = $(wildcard content/*.html)

index.html: $(GEN) $(FRAGS)
	mkdir -p bib
	./$(GEN) $@

# Data files are included at compile time, so they are generator inputs.
$(GEN): $(GEN).pl $(DATA)
	$(CIAOC) $(GEN)

clean:
	rm -f $(GEN) gen/*.po gen/*.itf gen/*.asr gen/*.ast

.PHONY: clean
