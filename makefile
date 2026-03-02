LATEXMK = latexmk
LATEXMK_OPTS = -pdf -interaction=nonstopmode -synctex=1 -shell-escape -f

MAIN = main.tex
OUTDIR = build

.PHONY: all main main-clean sub clean clean-output

all: main

main:
	$(LATEXMK) $(LATEXMK_OPTS) $(MAIN)

main-clean: main clean-output

# Build a subfile: make sub file=sections/F20-PRELIMINARIES.tex
sub:
ifndef file
	$(error Usage: make sub file=sections/SomeFile.tex)
endif
	$(LATEXMK) $(LATEXMK_OPTS) $(file)

clean-output:
	@if [ -d "$(OUTDIR)" ]; then \
		find "$(OUTDIR)" -type f ! -name '*.pdf' ! -name '*.synctex.gz' -delete; \
		find "$(OUTDIR)" -type d -empty -delete; \
	fi

clean: clean-output