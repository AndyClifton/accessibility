#!/bin/bash
#
#

echo "Running accessibility package tests..."
echo "...saving last test results"
if [ -d ../../tests_old/ ]; then
  rm -rf ../../tests_old/
fi
cp -RP ../../tests ../../tests_old/

# define DIRECTORIES
DIRECTORIES="article"
#
echo "...copying most recent accessibilty.sty to tests directories..."
for d in $DIRECTORIES
do
  cp accessibility.sty ../../tests/$d/
done

cd ../../tests
echo "...compiling tests"
echo "-------------------"
#
# loop through directories in tests
for d in $DIRECTORIES
do
  cd $d
  echo "...running $d examples"
  FILES=*.tex
  for f in $FILES
  do
    echo "...found file $f ..."
    filename=$(basename -- "$f")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "...processing $filename ..."
    find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" -exec rm -f {} +
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    bibtex "$filename"
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    pdflatex -shell-escape -halt-on-error -interaction=nonstopmode $f
    find $filename.* -type f ! -name "$filename.tex" ! -name "$filename.bib" ! -name "$filename.log" ! -name "$filename.pdf" -exec rm -f {} +
    echo "...finished $filename ..."
  done
  echo "...finished testing $d documents."
  cd ..
done
