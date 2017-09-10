#!/usr/bin/env bash

#    ipblocker is a bash script for ban easily single ips or range ips
#    using iptables. 

#    Copyright (C) 2013-2017 by Ángel Guzmán Maeso, shakaran at gmail dot com

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

function save_clean
{
        service iptables save
        > ban_ips.txt
}

usage()
{
    echo 'Usage: $0'
    echo 'Write one line foreach ban ip or range ip in a ban_ips.txt file.'
    echo 'After execute the script without arguments.'
    echo 'It allows CIDR format, single ip or ranges.'
    echo 'If some ip has bad format, you can inspect the generated file'
    echo 'ban_ips_wrong.txt.'
    
    exit 1
}

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

if [ -f ban_ips.txt ]; then
	for ip in `cat ban_ips.txt | tr -d ' '`;
			do
				if [[ "$ip" == *"/"* ]]; then
							echo "Parsing as CIDR $ip because contains /"
							iptables -A INPUT -s $ip -j DROP
					elif [[ "$ip" == *" - "* ]]; then
							echo "$ip Wrong format for range"
							
							# Move wrong ip for inspect before
							echo "$ip" >> ban_ips_wrong.txt
					elif [[ "$ip" == *"-"* ]]; then
							echo "Banning range $ip"
							iptables -I INPUT -m iprange --src-range $ip -j DROP
					else
							echo "Parsing $ip as single"
							echo "$ip" >> ban_ips_single.txt
							
					fi
	done
else
	usage
fi

if [ -f ban_ips_single.txt ]; then
	echo "Starting to ban single ips"
	
	# Avoid duplicates, but it only works for ips without ranges
	sort -un ban_ips_single.txt -o ban_ips_single.txt
	
	for ip in `cat ban_ips_single.txt`;
	do
		echo "Banning $ip as single"
		iptables -A INPUT -s $ip -j DROP
	done 
	
	# Clean single ips file
	rm -rf ban_ips_single.txt 
fi

save_clean
