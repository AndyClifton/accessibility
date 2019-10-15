#!/bin/bash
#
#

echo "Running accessibility package tests..."
echo "...saving last test results"
rm -rf ../../samples_old/
cp -RP ../../samples ../../samples_old/
#
echo "...copying most recent accessibilty.sty to samples directories..."
cp accessibility.sty ../../samples/KOMAscript/
cp accessibility.sty ../../samples/article/
#
cd ../../samples
echo "...compiling test documents"
echo "-------------------"
#
# loop through directories in samples
DIRECTORIES="article"
for d in $DIRECTORIES
do
  cd $d
  echo "...running $d examples"
  FILES=*.tex
  for f in $FILES
  do
    filename=$(basename -- "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "...processing $filename ..."
    find $filename.* -type f ! -name "$filename.tex" -exec rm -f {} +
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    bibtex $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.log" ! -name "$filename.pdf" -exec rm -f {} +
    echo "...finished $filename ..."
  done
  echo "...finished testing $d documents."
  cd ..
done
