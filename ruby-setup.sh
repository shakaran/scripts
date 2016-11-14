#!/usr/bin/env bash

#    ruby-setup is a bash script for install ruby on CentOS

#    Copyright (C) 2013-2016 by Ángel Guzmán Maeso, shakaran at gmail dot com

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

YAML_VERSION='0.1.6';
RUBY_VERSION_LATEST='2.3.1';
RUBYGEMS_VERSION='2.6.8';

if [ `/usr/bin/id -u` -ne 0 ]; then
    echo 'Please, run this script as root'
    exit 1
fi

wget http://pyyaml.org/download/libyaml/yaml-${YAML_VERSION}.tar.gz -O - | tar xvz
cd yaml-*; ./configure; make; make install; cd ..; rm -rf yaml-*

yum install -y libyaml libffi

# https://www.ruby-lang.org/es/news/2015/12/16/ruby-2-2-4-released/
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-${RUBY_VERSION_LATEST}.tar.gz -O - | tar xvz
cd ruby-*; ./configure --bindir=/usr --enable-shared; make; make install; cd ..; rm -rf ruby-*

# Uncomment this for Ruby 1.9
#RUBY_VERSION='1.9.3-p385'; wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-${RUBY_VERSION}.tar.gz -O - | tar xvz
#cd ruby-*; ./configure --enable-shared; make; make install; cd ..; rm -rf ruby-*

wget https://rubygems.org/rubygems/rubygems-${RUBYGEMS_VERSION}.tgz -O - | tar xvz
cd rubygems-*; ruby setup.rb; cd ..; rm -rf rubygems-*; ruby -v

# Install rails and update gems
gem install rails; gem update
