# useful functions
# addprefix https://stackoverflow.com/questions/61744882/combine-path-to-an-array-of-filenames-in-makefile#61745710
# filter-out https://stackoverflow.com/questions/5189187/makefile-how-to-exclude-one-particular-file-from-compilation
# pass variables https://stackoverflow.com/questions/2826029/passing-additional-variables-from-command-line-to-make
SLIDES_DIR=.
IGNORES=README.md

TO_FILTER_OUT=$(addprefix $(SLIDES_DIR)/,$(IGNORES))
MD_FILES=$(filter-out $(TO_FILTER_OUT), $(wildcard $(SLIDES_DIR)/*.md))
PDF_FILES=$(patsubst $(SLIDES_DIR)/%.md, $(SLIDES_DIR)/%.pdf, $(MD_FILES))
HTML_FILES=$(patsubst $(SLIDES_DIR)/%.md, $(SLIDES_DIR)/%.html, $(MD_FILES))

# print help
.PHONY : help
help : Makefile
	@sed -n 's/^##//p' $<

## all         : Compile all markdown files to PDF slides.
.PHONY : all
all : $(PDF_FILES) $(HTML_FILES)

## pdfs        : Create PDFs.
.PHONY : pdfs
pdfs : $(PDF_FILES)

$(SLIDES_DIR)/%.pdf : $(filter-out $(TO_FILTER_OUT),$(SLIDES_DIR)/%.md)
	npx @marp-team/marp-cli@latest $< -o $@

## htmls       : Create HTMLs.
.PHONY : htmls
htmls : $(HTMLS_FILES)

$(SLIDES_DIR)/%.html : $(filter-out $(TO_FILTER_OUT),$(SLIDES_DIR)/%.md)
	npx @marp-team/marp-cli@latest $< -o $@

## clean       : Remove auto-generated files.
.PHONY : clean
clean :
	rm -f $(PDF_FILES)
	rm -f $(HTML_FILES)

## variables   : Print variables (for debugging).
.PHONY : variables
variables:
	@echo MD_FILES: $(MD_FILES)
	@echo PDF_FILES: $(PDF_FILES)
