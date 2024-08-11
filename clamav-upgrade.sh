#!/usr/bin/env bash

#    clamav-upgrade is a bash script to upgrade Clamav's version in 
#    cPanel production servers.
#  
#    The purpose of this script is upgrade a quickly Clamav's cPanel 
#    production server since that cPanel sync usually takes several days
#    or weeks to reach the production server and some attackers could use
#    this window maintenance in advantage.

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

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

# clamscan -V

# Search last version manually in http://www.clamav.net/download/sources/ 
# (TODO: this could be improved autodetecting and filtering the latest from sourceforge site)
CLAMAV_PREVIOUS_VERSION='0.98.1'
CLAMAV_CURRENT_VERSION='0.98.3'
CLAMAV_NEW_VERSION='0.98.4'

CLAMAV_CPANEL_FOLDER='/usr/local/cpanel/modules-install/clamavconnector-Linux-x86_64'

# Control if $CLAMAV_CPANEL_FOLDER doesn't exist.
if [ ! -d "${CLAMAV_CPANEL_FOLDER}" ]; then
    echo 'Aborting. Could not find the Clamav cPanel folder in ${CLAMAV_CPANEL_FOLDER}'
    exit 1
else
	# Change to working cPanel dir (32 or 64 bits)
	cd ${CLAMAV_CPANEL_FOLDER}
	wget http://downloads.sourceforge.net/clamav/clamav-${CLAMAV_NEW_VERSION}.tar.gz -O clamav-${CLAMAV_NEW_VERSION}.tar.gz

	# sed -i 's/AVV=${CLAMAV_CURRENT_VERSION}/AVV=${CLAMAV_NEW_VERSION}/g' install
	replace 'AVV=${CLAMAV_CURRENT_VERSION}' 'AVV=${CLAMAV_NEW_VERSION}' -- install
	#sed -i 's/AVVOLD\=${CLAMAV_PREVIOUS_VERSION}/AVVOLD\=${CLAMAV_CURRENT_VERSION}/g' install
    replace 'AVVOLD=${CLAMAV_PREVIOUS_VERSION}' 'AVVOLD=${CLAMAV_CURRENT_VERSION}' -- install

	echo "${CLAMAV_NEW_VERSION}" > progversion

	./install; cd
	
	# Update antivirus database
	freshclam
	
	# Force to scan new ClamAV perl modules (File-Scan-ClamAV) for ensure nice behaviour
	/scripts/perlinstaller --force File::Scan::ClamAV
	
	# Avoid warnings by Altered RPMs found by check_cpanel_rpms cpanel script
	# This override global settings and use /var/cpanel/rpm.versions.d/local.versions file
	/scripts/update_local_rpm_versions --edit target_settings.cpanel-clamav unmanaged
fi
