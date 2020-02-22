FILE = tagged-article
ENGINE = lualatex
TEMPLDIR = ../common

pdf:
	pandoc -o $(FILE).pdf $(FILE).md --lua-filter=$(TEMPLDIR)/tagged-filter.lua --pdf-engine=$(ENGINE) --template=$(TEMPLDIR)/tagged-template.latex

tex:
	pandoc -o $(FILE).tex $(FILE).md --filter=pandoc-citeproc --lua-filter=$(TEMPLDIR)/tagged-filter.lua --template=$(TEMPLDIR)/tagged-template.latex --bibliography=$(FILE).bib

clean:
	rm -f $(FILE).aux $(FILE).log $(FILE).xmpdata pdfa.xmpi

pdfnb: tex
	sed -i '/^$$/d;/\\endfirsthead/,/\\endhead/c\\\endfirsthead' $(FILE).tex
	rm -f $(FILE).xmpdata
	$(ENGINE) $(FILE).tex
