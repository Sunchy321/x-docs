FIGURES = $(patsubst %.dot,%.pdf,$(wildcard *.dot))

STDPDF = xelatex x.tex | grep -v "^Overfull"

default: refresh

clean:
	rm -f *.aux x.pdf *.idx *.ilg *.ind *.log *.lot *.lof *.tmp *.out

refresh:
	$(STDPDF)
	open x.pdf

rebuild:
	$(STDPDF)
	$(STDPDF)
	$(STDPDF)
	open x.pdf

full: $(FIGURES) reindex

reindex:
	$(STDPDF)
	$(STDPDF)
	$(STDPDF)
	makeindex generalindex
	makeindex libraryindex
	makeindex grammarindex
	$(STDPDF)
	$(STDPDF)
	open x.pdf

### Makefile ends here
