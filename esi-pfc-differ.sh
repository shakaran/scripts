#!/usr/bin/env bash

#    esi-pfc-differ is a bash script for compare new changes in PFC 
#    normative for ESI-UCLM.
#    It was originally created for verify changes in this web notice
#    http://webpub.esi.uclm.es/actualidad/noticias/normativa-proyecto-fin-de-carrera

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

mkdir -p esi-pfc-differ && cd esi-pfc-differ

wget http://webpub.esi.uclm.es/archivos/89/NormativaPFC2007 -O NormativaPFC2007.pdf 
pdftotext -layout NormativaPFC2007.pdf NormativaPFC2007.txt

wget http://webpub.esi.uclm.es/archivos/211/Normativa-PFC-2013 -O Normativa-PFC-2013.pdf 
pdftotext -layout Normativa-PFC-2013.pdf Normativa-PFC-2013.txt

diff -bBu NormativaPFC2007.txt Normativa-PFC-2013.txt > esi-pfc-changes.diff
diff --side-by-side NormativaPFC2007.txt Normativa-PFC-2013.txt | pager
