#!/usr/bin/env bash

#    zerolog is a bash script for delete common logs on /var/log and
#    avoid fill the disk with rotated files. It backups previously
#    the logs on home folder and it can preserve logs older than
#    a date given on days. This is useful for avoid slow sessions
#    starts on bash terminals.

#    Copyright (C) 2012 by Ángel Guzmán Maeso, shakaran at gmail dot com

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

usage(){
    echo 'Usage: $0 [DAYS]'
    echo 'DAYS: Remove logs older than DAYS. Default: 0 days'
    exit 1
}

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    usage
fi

if [ -z "$1" ]; then
    MTIME_DAYS=''
else
    MTIME_DAYS='-mtime +$1'
fi

echo Currently logs size: `du -hs /var/log/ | awk {'print $1'}`
echo 'Backup the log folder on home'
tar zcPf ~/logs-`date '+%m-%d-%y-%H:%M:%S'`.tar.gz /var/log

echo 'Removing rotated log files'
find /var/log/ -type f $MTIME_DAYS -name *.gz -exec rm -rf '{}' \;

echo 'Emptying the logs'
for logs in `find /var/log $MTIME_DAYS -type f`; do > $logs; done

echo Currently logs size: `du -hs /var/log/ | awk {'print $1'}`