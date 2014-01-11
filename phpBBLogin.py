#!/usr/bin/env python
# *-* coding: utf-8 *-*

#    Copyright (C) 2014 by Ángel Guzmán Maeso, shakaran at gmail dot com

#    phpBBLogin is a simple python script for login in phpBB forums and extract links
#    from forum threads (for example with direct download files)

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

# pip install html5lib beautifulsoup4 requests
import requests
from bs4 import BeautifulSoup

class phpBBLogin:
    
    FORUM_URL    = 'http://somesite.com/forum/ucp.php?mode=login'
    DOWNLOAD_URL = 'http://somesite.com/forum/viewtopic.php?f=155&t=1117041'
    
    login_params = {
            'username': 'your_username',
            'password': 'your_password',
            'autologin': 'on',
            'redirect' : 'index.php',
            'login' : 'Login',
        }
    
    def __init__(self):
        self.session = requests.session()
        self.fetch_sid()
        self.login_post()

    def fetch_sid(self):
        r = self.session.get(self.FORUM_URL, verify=False)

        if r: 
            if r.status_code == requests.codes.ok:
                form_page = BeautifulSoup(str(r.content))
                form_element = form_page.find('form', { 'id':'login'})
                self.sid = form_element['action'].split('sid=')[1]
                self.login_params['sid'] = self.sid
             
    def fetch_links(self):
        downloaded_data = self.session.get(self.DOWNLOAD_URL)

        thread_data = BeautifulSoup(str(downloaded_data.content))
        
        thread_content = thread_data.find('div', { 'class':'content'})
        
        if thread_content:
            links = thread_content.find_all('a', {'class' : 'postlink'})
        
            if links:
                for link in links:
                    print(str(link['href']))
               
    def login_post(self):
        r = self.session.post(self.FORUM_URL, data=self.login_params, verify=False)

        if r: 
            if r.status_code == requests.codes.ok:
                #print (r.cookies)
        
                #print (r.content)
                
                self.fetch_links()
                
            else:
                print('Error: ' + str(r.status_code))
        else:
            print('Error: could not create the request')

if __name__ == "__main__":
    phpBBLogin()
    