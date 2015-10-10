#!/bin/bash
# Copyright 2015
#
# Filename: install_packages.sh
# Author: Shuai
# Contact: lishuai918@gmail.com
# Created: Tue Mar 31 15:26:27 2015 (+0800)
# Package-Requires: ()
# Last-Updated:
#           By:
#     Update #: 27
#
#
# Commentary:
# This script is used to install necessary tex package after installing texlive
# from ubuntu source.
#
#
#
# Code:



tlmgr init-usertree
# Let tlmgr download documentation when installing new packages.
tlmgr option docfiles 1

# For beamer
# #########################################################################

# For mdframed.
tlmgr install mdframed etoolbox needspace
# For fancy title page.
tlmgr install framed fontawesome
# For Chinese.
tlmgr install xecjk l3kernel l3packages
# For moderncv
tlmgr install moderncv xargs lipsum everypage
# For beamer citation.
tlmgr install biblatex logreq
# For floating comments.
tlmgr install textpos
# For including files from different folders.
tlmgr install import

# For general latex.
# #########################################################################
# Though those two packages have been included by default, it seems to remove
# some bugs to install it again. Maybe the new version is installed.
tlmgr install fontspec xltxtra
tlmgr install ifplatform xstring lineno paralist cleveref

#
# install_packages.sh ends here
