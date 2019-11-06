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
pdflatex anleitung-DE.tex
bibtex anleitung-DE
pdflatex anleitung-DE.tex
pdflatex anleitung-DE.tex
if [ -f accessibility-Anleitung-DE.pdf ]; then
   echo "...Remove old instructions"
  rm -f accessibility-Anleitung-DE.pdf
fi
ln -f anleitung-DE.pdf accessibility-Anleitung-DE.pdf
echo "...Remove latex build files"
find anleitung-DE.* -type f ! -name "anleitung-DE.tex" ! -name "anleitung-DE.pdf" -exec rm -f {} +

# generate english-language documentation
cp ../../samples/article/article_release.pdf accessibility.pdf

# generate the CTAN .zip file
echo "...generate an archive for CTAN"
if [ -f accessibility.tar.gz ]; then
   echo "...remove old archive"
   rm accessibility.tar.gz
fi
dos2unix *.md
ctanify --pkgname accessibility \
  accessibility.ins \
  accessibility.sty \
  accessibility.pdf \
  accessibility-Anleitung-DE.pdf \
  README.md \
  CHANGELOG.md \
  --no-tds

echo "...done!"
