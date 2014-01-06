#!/usr/bin/env python3
# *-* coding: utf-8 *-*

#    Copyright (C) 2014 by Ángel Guzmán Maeso, shakaran at gmail dot com

#    goog_market_cap is a simple python script for know the GOOG Market Cap value from Yahoo Finance

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

from bs4 import BeautifulSoup
import requests

r  = requests.get('http://finance.yahoo.com/q?s=GOOG')

if r and r.status_code == 200:
    market_cap = BeautifulSoup(r.text).find('span', {'id':'yfs_j10_goog'}).get_text()
    print('GOOG Market Cap value: ' + str(market_cap))