FILE = tagged-pres
ENGINE = lualatex
TEMPLDIR = ../common

pdf:
	pandoc -t beamer -o $(FILE).pdf $(FILE).md --lua-filter=$(TEMPLDIR)/tagged-filter.lua --pdf-engine=$(ENGINE) --template=$(TEMPLDIR)/tagged-template.latex

tex:
	pandoc -t beamer -o $(FILE).tex $(FILE).md --lua-filter=$(TEMPLDIR)/tagged-filter.lua --template=$(TEMPLDIR)/tagged-template.latex

pdfnb: tex
	sed -i '/^$$/d' $(FILE).tex
	rm -f $(FILE).xmpdata
	$(ENGINE) $(FILE).tex
