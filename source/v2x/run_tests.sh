#!/bin/bash
#
#

echo "Running accessibility package tests..."
echo "...saving last test results"
if [ -d ../../samples_old/ ]; then
  rm -rf ../../samples_old/
fi
cp -RP ../../samples ../../samples_old/

# define DIRECTORIES
DIRECTORIES="article"
#
echo "...copying most recent accessibilty.sty to samples directories..."
for d in $DIRECTORIES
do
  cp accessibility.sty ../../samples/$d/
done

cd ../../samples
echo "...compiling test documents"
echo "-------------------"
#
# loop through directories in samples
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
