#!/usr/bin/env python3
# *-* coding: utf-8 *-*

#    housemov is a simple python script for know the number of transmitted housing (house movements)
#    between spanish citiens. It fetch real data from (Consejo General del Notariado, entro de información estadística del notariado)
#    This script is based in montly report from http://www.notariado.org/liferay/web/cien/estadisticas-principales/inmuebles/evolucion-de-compraventa-de-viviendas

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

import requests

payload = {
           'entidad': 'VIVIENDA', 
           'actos': '0501A',
           'aparcamientoAnejo': '',
           'tiposObjetos': '3',
           'clasesFincasUrbanas': '14,15,16,17',
           'fechaInicio': '01/01/2007', # This is the date more ancient to fetch
           'fechaFin': '01/01/2016', # Currently only offered until this recent date
           'tipoConstruccion': '',
           'tiposObjetos': '3', # Unkwon object types, 3 is a valid value
           'campos': 'mes,ano,numTotal', # Valid provincia, comunidad and municipio fields (but this will take more a huge time to fetch)
           'trasteroAnejo': '',
           }

r = requests.post(url = 'http://www.notariado.org/cienServices/service/estadistica/json', params = payload)

# print('Fetching from ' + r.url)

if r:
    data = r.json()

    if data['datos']:
        for item in data['datos']:
            #print (item)
            print ('Año: {0} Mes: {1} Total: {2}'.format(item['ano'], item['mes'], item['numTotal']))
