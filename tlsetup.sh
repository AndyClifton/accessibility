#!/bin/bash
#
# Use this file (on OS X) to initiate latex on the Travis CI system
#

# install tex live
- sudo apt-get install -y --no-install-recommends texlive-full

# Install decompression tool to extract LaTex packages later on
sudo apt-get install -y xzdec

# Install biber for .bib compilation
sudo apt-get install -y biber

# Initialize user tree for installing additional packages
sudo tlmgr init-usertree
