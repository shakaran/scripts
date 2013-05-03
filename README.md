# Shakaran’s scripts

## Introduction

This a collection of common and useful scripts that I found or create for diary use.

## Scripts

* zerolog: is a bash script for delete common logs on /var/log and avoid fill the disk with rotated files. It backups previously the logs on home folder and it can preserve logs older than a date given on days. This is useful for avoid slow sessions starts on bash terminals.

* kernpurge: is a bash script for delete old kernels and clean old kernel entries in grub.

* ipblocker: is a bash script for ban easily single ips or range ips
using iptables.

It is used for ban bulk ip address or serveral ranges ips at one time. For that write a line for
every ip or range ip in the file ban_ips.txt. It allows CIDR format, single ip or ranges. After 
execute the script without arguments.

If some ip has bad format, you can inspect the generated file ban_ips_wrong.txt.

* jhbuild-setup: is a bash script for easy install jhbuild

* git-bz-setup: is a bash script for easy install git-bz

* pt-cpanel: is a bash script for install Percona Toolkit under a CentOS system with cPanel.

See more info about Percona Toolkit at http://www.percona.com/doc/percona-toolkit/

* ruby-setup: is a bash script for install ruby on CentOS

* showcon: is a bash script for print TCP and UDP total connections order ascendent by user

* repo-setup: is a bash script for easy install repo python script

See more info about repo at:

- http://source.android.com/source/version-control.html
- https://code.google.com/p/git-repo/

* esi-pfc-differ: is a bash script for compare new changes in PFC normative for ESI-UCLM.
It was originally created for verify changes in this web notice
http://webpub.esi.uclm.es/actualidad/noticias/normativa-proyecto-fin-de-carrera

* clamav-upgrade: is a bash script to upgrade Clamav's version in cPanel production servers

The purpose of this script is upgrade a quickly Clamav's cPanel 
production server since that cPanel sync usually takes several days
or weeks to reach the production server and some attackers could use
this window maintenance in advantage.
