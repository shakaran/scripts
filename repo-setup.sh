#!/usr/bin/env bash

#    repo-setup is a bash script for easy install repo python script

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

REPO_VERSION='1.19'

echo 'Downloading repo...'
wget https://git-repo.googlecode.com/files/repo-${REPO_VERSION} -O ~/.local/bin/repo

echo 'Configuring repo...'
chmod +x ~/.local/bin/repo
echo PATH=$PATH:~/.local/bin >> ~/.bashrc
