#!/bin/bash
#
#

echo "Running accessibility package tests..."
echo "...saving last test results"
cp -RP ../../samples ../../samples_old

echo "...copying most recent accessibilty.sty to samples directories..."
cp accessibility.sty ../../samples/KOMAscript/
cp accessibility.sty ../../samples/article/

cd ../../samples
echo "...compiling test documents"
echo "-------------------"
echo "...running KOMAscript examples"
cd KOMAscript/
# 1. Testdokument1.tex
echo "...1. Testdokument1.tex"
find Testdokument1.* -type f ! -name "Testdokument1.tex" -exec rm -f {} +
pdflatex Testdokument1.tex
bibtex Testdokument1.tex
pdflatex Testdokument1.tex
pdflatex Testdokument1.tex

echo "...finished testing KOMAscript documents."
cd ..

echo "... running article examples"
cd article/

# 1. Testdokument1.tex
echo "... 1. article1.tex"
find article1.* -type f ! -name "article1.tex" -exec rm -f {} +
pdflatex article1.tex
bibtex article1.tex
pdflatex article1.tex
pdflatex article1.tex

echo "... finished testing article documents."
