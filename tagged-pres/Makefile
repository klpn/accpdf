FILE = tagged-pres
ENGINE = lualatex

pdf:
	pandoc -t beamer -o $(FILE).pdf $(FILE).md --lua-filter=$(FILE).lua --pdf-engine=$(ENGINE) --template=$(FILE)-template.latex
