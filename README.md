# Shakaran’s scripts

## Introduction

This a collection of common and useful scripts that I found or create for diary use.

## Scripts

* zerolog: is a bash script for delete common logs on /var/log and avoid fill the disk with rotated files. It backups previously the logs on home folder and it can preserve logs older than a date given on days. This is useful for avoid slow sessions starts on bash terminals.

* kernpurge: is a bash script for delete old kernels and clean old kernel entries in grub.

* ipblocker: ipblocker is a bash script for ban easily single ips or range ips
using iptables.

It is used for ban bulk ip address or serveral ranges ips at one time. For that write a line for
every ip or range ip in the file ban_ips.txt. It allows CIDR format, single ip or ranges. After 
execute the script without arguments.

If some ip has bad format, you can inspect the generated file ban_ips_wrong.txt.
