#!/usr/bin/env bash

#    cp-login-inspect is a bash script for easily check all lastlogin
#    ip data for each cpanel account in a server and geolocate each ip for
#    detect suspicious activity from non legitimate countries or hacked
#    accounts

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

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

if [ -f "$1" ] && [ $1 == "-c" ]; then
    echo 'Cleaning .lastlogin files to backup-lastlogin.log'

    for user in `ls -A /var/cpanel/users` ;
    do
      	if [ -f /home/$user/.lastlogin ]; then
                ip=`cat /home/$user/.lastlogin`
                echo "$user - $ip - `geoiplookup $ip`" >> backup-lastlogin-`date '+%m-%d-%y'`.log
                rm -rf /home/$user/.lastlogin
        fi
    done
else
    echo "Reading .lastlogin files"
    for user in `ls -A /var/cpanel/users` ;
    do
      	if [ -f /home/$user/.lastlogin ]; then
                ip=`cat /home/$user/.lastlogin`
                echo "$user - $ip - `geoiplookup $ip`"
        fi
    done
    echo "Done"
fi
