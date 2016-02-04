#!/usr/bin/env bash

#    setup-nginx-dev is a bash script to install the nginx development version

#    Copyright (C) 2016 by Ángel Guzmán Maeso, shakaran at gmail dot com

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

if [[ -r /etc/os-release ]]; then
    . /etc/os-release
    if [[ $ID = ubuntu ]]; then
        read _ UBUNTU_VERSION_NAME <<< "$VERSION"
        echo "Running Ubuntu $UBUNTU_VERSION_NAME"
    else
        echo "Not running an Ubuntu distribution. ID=$ID, VERSION=$VERSION"
    fi
else
    echo "Not running a distribution with /etc/os-release available"
fi

UBUNTU_CODENAME=`lsb_release -c | cut -f2`
nginx=development
echo "deb http://ppa.launchpad.net/nginx/$nginx/ubuntu ${UBUNTU_CODENAME} main" > /etc/apt/sources.list.d/nginx-$nginx-${UBUNTU_CODENAME}.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
apt-get update
apt-get -y install nginx
systemctl start nginx
echo "Nginx `nginx -v  2>&1 | cut -f2  -d/` installed"
