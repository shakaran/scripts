#!/usr/bin/env bash

#    pt-cpanel is a bash script for install Percona Toolkit under 
#    a CentOS system with cPanel.
#    
#    See more info about Percona Toolkit at:
#    http://www.percona.com/doc/percona-toolkit/
#
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

# For allow install packages, remove mysql* perl* in cPanel yum.conf
echo 'Disabling cPanel exclude packages'
sed -i 's/exclude=/#exclude=/g' /etc/yum.conf

# Avoid problems with mysql-libs (For Mysql 5.1 -> 5.5)
rpm -Uhv http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum install -y Percona-Server-shared-compat

echo 'Installing Percona Toolkit dependencies'
yum install -y perl-DBD-MySQL perl-IO-Socket-SSL

# Prevent failures with incorrect libmysqlclient (dirty workaround)
if [ ! -f /usr/lib64/libmysqlclient.so.18 ]; then
    cp -rf /usr/lib64/libmysqlclient.so.16 /usr/lib64/libmysqlclient.so.18
    # ln -s /usr/lib64/libmysqlclient.so.16 /usr/lib64/libmysqlclient.so.18
fi

echo 'Downloading the latest percona-toolkit and installing'
wget percona.com/get/percona-toolkit.rpm -O percona-toolkit.rpm && rpm -Uvh percona-toolkit.rpm
rm -rf percona-toolkit.rpm

# Disable Percona repo (avoid future Percona-Server-shared-compat updates)
sed -i "s/enabled = 1/enabled = 0/g" /etc/yum.repos.d/Percona.repo

# Restore yum.conf
sed -i 's/#exclude=/exclude=/g' /etc/yum.conf
