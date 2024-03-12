# Makefile for SEBA Gardens membership form
# Run `make` to build the Membership Form & Map.

all: SEBA_Gardens_Membership_Form.pdf SEBA_Gardens_Plot_Map.pdf
.PHONY: all clean

%.pdf: %.tex
	latexmk $< && latexmk -c

clean:
	latexmk -C
