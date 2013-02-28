#!/usr/bin/env bash

#    git-bz-setup is a bash script for easy install git-bz

#    Copyright (C) 2013 by Ángel Guzmán Maeso, shakaran at gmail dot com

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

echo 'Installing common dependencies...'
sudo apt-get install asciidoc

echo 'Getting git-bz...'
git clone -b master --single-branch git clone git://git.fishsoup.net/git-bz git-bz 

echo 'Compiling git-bz...'
cd git-bz; make;

echo 'Configuring git-bz...'
echo PATH=$PATH:~/.local/bin >> ~/.bashrc
cp -rf git-bz ~/.local/bin/git-bz
