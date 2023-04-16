LTX_COMPILER ?= pdflatex
RELEASE ?= cahier_tp_git

GH ?= gh

all: main.pdf

%.pdf : %.tex
	$(LTX_COMPILER) $< && $(LTX_COMPILER) -shell-escape $< && mv $@ $(RELEASE).pdf

clean:
	rm -f *.aux *.log *.out *.pdf *.fdb_latexmk *.fls *.gz \
		src/*.aux

publish:
	$(GH) release create $(TAG) $(RELEASE).pdf --target master