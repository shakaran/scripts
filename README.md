# Shakaran’s scripts

<a href="https://www.patreon.com/shakaran"><img src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160"></a>

## Introduction

This a collection of common and useful scripts that I found or create for diary use or for my freelance customers.

## Scripts

* zerolog: is a bash script for delete common logs on /var/log and avoid fill the disk with rotated files. It backups previously the logs on home folder and it can preserve logs older than a date given on days. This is useful for avoid slow sessions starts on bash terminals.

* kernpurge: is a bash script for delete old kernels and clean old kernel entries in grub.

    Quick use:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/kernpurge.sh -O - | bash
    ```

* ipblocker: is a bash script for ban easily single ips or range ips using iptables.

    It is used for ban bulk ip address or serveral ranges ips at one time. For that write a line for
    every ip or range ip in the file ban_ips.txt. It allows CIDR format, single ip or ranges. After 
    execute the script without arguments.

    If some ip has bad format, you can inspect the generated file ban_ips_wrong.txt.

* jhbuild-setup: is a bash script for easy install jhbuild

* git-bz-setup: is a bash script for easy install git-bz

* pt-cpanel: is a bash script for install Percona Toolkit under a CentOS system with cPanel.

    See more info about Percona Toolkit at http://www.percona.com/doc/percona-toolkit/

* ruby-setup: is a bash script for install ruby on CentOS

    Quick use:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/ruby-setup.sh -O - | bash
    ```
    
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

*   cp-login-inspect: is a bash script for easily check all lastlogin
ip data for each cpanel account in a server and geolocate each ip for
detect suspicious activity from non legitimate countries or hacked
accounts

    With the option -c you can clear all the files and backup the data in
    a backup file. Without arguments you get all the output without clear any
    useful data.

*   Another item in the list.

* exiftool-setup: is a bash script for easy install exiftool from sources

* fix-ubuntu-privacy: remove some config and features for protect invasive user privacy policy in ubuntu

* housemov: is a simple python script for know the number of transmitted housing (house movements)
between spanish citiens. It fetch real data from (Consejo General del Notariado, entro de información estadística del notariado)
    This script is based in montly report from 
    http://www.notariado.org/liferay/web/cien/estadisticas-principales/inmuebles/evolucion-de-compraventa-de-viviendas

* goog_market_cap: is a simple python script for know the GOOG Market Cap value from Yahoo Finance

* whois-setup: is a bash script for setup the Debian version (http://packages.qa.debian.org/w/whois.html) 
of whois program in CentOS servers (instead of jwhois that offers less data)

* phpBBLogin: is a simple python script for login in phpBB forums and extract links
from forum threads (for example with direct download files)

* ubuntu-percona-5.7-setup: is a bash script for setup Percona 5.7 in Ubuntu

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/ubuntu-percona-5.7-setup.sh -O - | bash
    ```

* setup-mutt: is a bash script to install the Mutt E-Mail Client

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/setup-mutt.sh -O - | bash
    ```
    
    Or with curl:
    
    ```bash
    curl -fsSL https://raw.githubusercontent.com/shakaran/scripts/master/setup-mutt.sh | bash
    ```
    
* setup-forge-cli: is a bash script to install the Laravel's Forge-cli 

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/setup-forge-cli.sh -O - | bash
    ```

* purge-apache: is a bash script to delete and purge Apache in a server

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/purge-apache.sh -O - | bash
    ```
    
    Or with curl:
    
    ```bash
    curl -fsSL https://raw.githubusercontent.com/shakaran/scripts/master/purge-apache.sh | bash
    ```

* setup-nginx-dev: is a bash script to install the nginx development version

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/setup-nginx-dev.sh -O - | bash
    ```
    
    Or with curl:
    
    ```bash
    curl -fsSL https://raw.githubusercontent.com/shakaran/scripts/master/setup-nginx-dev.sh | bash
    ```   

* setup-htop2: is a bash script to install htop from source

    Quick setup:

    ```bash
    wget https://raw.githubusercontent.com/shakaran/scripts/master/setup-htop2.sh -O - | bash
    ```
    
    Or with curl:
    
    ```bash
    curl -fsSL https://raw.githubusercontent.com/shakaran/scripts/master/setup-htop2.sh | bash
    ```   

## Buy me a coffe or beer!

[![Buy me a coffee](https://i.imgur.com/Sk4LFzF.png)](https://www.paypal.me/quijost/3)
