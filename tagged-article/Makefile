FILE = tagged-article
ENGINE = lualatex
TEMPLDIR = ../common

pdf:
	pandoc -o $(FILE).pdf $(FILE).md --lua-filter=$(TEMPLDIR)/tagged-filter.lua --pdf-engine=$(ENGINE) --template=$(TEMPLDIR)/tagged-template.latex

tex:
	pandoc -o $(FILE).tex $(FILE).md --lua-filter=$(TEMPLDIR)/tagged-filter.lua --template=$(TEMPLDIR)/tagged-template.latex

pdfnb: tex
	sed -i '/^$$/d' $(FILE).tex
	$(ENGINE) $(FILE).tex
