#!/usr/bin/env bash

#    ubuntu-percona-5.7-setup is a bash script for setup Percona 5.6 in
#    Ubuntu

#    Copyright (C) 2015-2016 by Ángel Guzmán Maeso, shakaran at gmail dot com

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

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
    # Otherwise, use release info file
    else
        export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1)
    fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && export DISTRO=$UNAME
unset UNAME

# Check only for Ubuntu
if [ "$DISTRO" != "Ubuntu" ]; then
    echo "This script is only for Ubuntu machines. Detected $DISTRO"
    exit 1
fi

# Add the repo key

apt-key adv --keyserver keys.gnupg.net --recv-keys 8507EFA5

# Add repo
for deb in deb deb-src; do echo "$deb http://repo.percona.com/apt `lsb_release -cs` main"; done | sudo tee -a /etc/apt/sources.list

# Update
apt-get -q -q update

# Install percona 5.7
DEBIAN_FRONTEND=noninteractive apt-get -q -q install -y --allow-unauthenticated percona-server-server-5.7 percona-server-client-5.7 percona-server-5.7-dbg
echo "Percona sucessfully installed."

mysql_secure_installation
