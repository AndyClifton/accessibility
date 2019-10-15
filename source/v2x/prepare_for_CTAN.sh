#!/bin/bash
#
# this file based on https://github.com/gi-ev/LNI/blob/master/prepare_for_CTAN
#
# Use this file (on OS X) to generate the zip archive for CTAN
# ctanify is part of TeX Live and MiKTeX distributions
# Please note, that you need at least version 1.9 to add the symbolic link correctly.
#
echo "Preparing the accessibility package for CTAN..."
echo "...generate the package from the .dtx file"
latex accessibility.ins
# Generate the documentation from the .dtx file; this will be in German
echo "...generate the instructions (DE)"
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
if [ -f accessibility-Anleitung-DE.pdf ]; then
   echo "...Remove old instructions"
  rm -f accessibility-Anleitung-DE.pdf
fi
ln -f main.pdf accessibility-Anleitung-DE.pdf

# generate english-language documentation

# generate the CTAN .zip file
echo "...generate an archive for CTAN"
if [ -f accessibility.tar.gz ]; then
   echo "...remove old archive"
   rm accessibility.tar.gz
fi
dos2unix *.md
ctanify --pkgname accessibility accessibility.ins accessibility-Anleitung.pdf README.md CHANGELOG.md "accessibility-Anleitung-DE.pdf=doc/latex/accessibility" "../../samples/KOMAscript/*.tex=doc/latex/accessibility"

echo "...complete!"
