#!/usr/bin/env sh
# Originally from https://github.com/latex3/latex3
# This script is used for building LaTeX files using Travis
# A minimal current TL is installed adding only the packages that are
# required
# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v pdflatex > /dev/null; then
  # Obtain TeX Live
  wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*
  # Install a minimal system
  ./install-tl --profile=../texlive/texlive.profile
  cd ..
fi

# install accessibility
export TEXMFHOME="~/texmf"
mkdir $TEXMFHOME/tex/latex/accessibility
cp $TRAVIS_BUILD_DIR/source/v2x/accessibility.sty $TEXMFHOME/tex/latex/accessibility/accessibility.sty

# We need to change the working directory before including a file
cd "$(dirname "${BASH_SOURCE[0]}")"

# set the repo
tlmgr option repository ctan

# run an update
tlmgr update --all

# install fonts
tlmgr install collection-fontsrecommended
# Install the cmap packages
tlmgr install cmap

# Install babel languages manually, texliveonfly does't understand the babel error message
tlmgr install collection-langenglish
tlmgr install collection-langeuropean

# Install package to install packages automatically
tlmgr install texliveonfly

# install the list of packages
tlmgr install $(cat texlive_packages)

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0
# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install
