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
#     Update #: 17
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
# For mdframed.
tlmgr install mdframed etoolbox needspace
# For fancy title page.
tlmgr install framed fontawesome
# For Chinese.
tlmgr install xecjk l3kernel l3packages
# For moderncv
tlmgr install moderncv xargs lipsum everypage

#
# install_packages.sh ends here
