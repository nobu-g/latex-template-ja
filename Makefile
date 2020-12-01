BUILD_DIR := build
IMG_DIR := img
TEX := main.tex
BIB := main.bib

DOC := $(basename $(TEX))
BBL := $(BUILD_DIR)/$(DOC).bbl
DVI := $(BUILD_DIR)/$(DOC).dvi
AUX := $(BUILD_DIR)/$(DOC).aux
PDF := $(BUILD_DIR)/$(DOC).pdf
IMGS := $(shell find $(IMG_DIR) -type f)

.PHONY: all clean

all: $(PDF)

$(PDF): $(DVI)
	dvipdfmx -o $@ $<

$(DVI): $(TEX) $(IMGS) $(BBL)
	platex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $<
	platex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $<

$(BBL): $(AUX) $(BIB)

$(AUX): $(BIB)
	platex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(TEX)
	pbibtex -kanji=utf8 $(basename $@)

clean:
	rm -f $(BUILD_DIR)/*
