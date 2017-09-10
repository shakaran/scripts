#!/usr/bin/env bash

#    setup-forge-cli is a bash script to install the Laravel's Forge-cli 

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

wget https://raw.githubusercontent.com/adamgoose/forge-cli/master/dist/forge-cli.phar
chmod +x forge-cli.phar
mv forge-cli.phar /usr/local/bin/forge
