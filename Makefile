# Makefile for LaTeX compilation with bibliography support

# Main document name without extension
DOCNAME = Main

# LaTeX compiler and options
LATEX = xelatex -interaction=nonstopmode
BIBER = biber

# Default target: full compilation
all: pdf

# Full compilation with bibliography
pdf:
	$(LATEX) $(DOCNAME).tex || (echo "First LaTeX pass failed. Check Main.log for errors." && exit 1)
	$(BIBER) $(DOCNAME) || (echo "Biber failed. Check Main.blg for errors." && exit 1)
	$(LATEX) $(DOCNAME).tex || (echo "Second LaTeX pass failed. Check Main.log for errors." && exit 1)
	@echo "PDF compilation complete."

# Clean temporary files
clean:
	rm -f $(DOCNAME).aux $(DOCNAME).bbl $(DOCNAME).bcf $(DOCNAME).blg \
		$(DOCNAME).log $(DOCNAME).out $(DOCNAME).run.xml $(DOCNAME).toc \
		$(DOCNAME).lof $(DOCNAME).lot $(DOCNAME).idx $(DOCNAME).ilg \
		$(DOCNAME).ind $(DOCNAME).synctex.gz

# Clean and rebuild
rebuild: clean pdf

# Continue despite errors (use this if you want to complete all steps regardless of errors)
force-pdf:
	-$(LATEX) $(DOCNAME).tex
	-$(BIBER) $(DOCNAME)
	-$(LATEX) $(DOCNAME).tex
	-$(LATEX) $(DOCNAME).tex
	@echo "Force PDF compilation complete (errors may have occurred)."

.PHONY: all pdf clean rebuild force-pdf
