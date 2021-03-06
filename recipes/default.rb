#
# Cookbook Name:: vagrant-cookbook
# Recipe:: default
#
# Copyright 2013, Texas A&M
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe "nodejs::nodejs_from_source"

%w[
  vim
  screen
  python-pip
].each do |pkg|
  package pkg do
    action :install
  end
end

easy_install_package "setuptools-git" do
  action :install
end

npm_package "less" do
  version "1.3.3"
  action :install
end

cookbook_file node[:vagrant_developer][:gitconfig_destination] do
    action :create
    owner "vagrant"
    group "vagrant"
    mode "0664"
    source node[:vagrant_developer][:gitconfig_source]
end

cookbook_file node[:vagrant_developer][:gitignore_destination] do
  action :create
  owner "vagrant"
  group "vagrant"
  source node[:vagrant_developer][:gitignore_source]
end

cookbook_file node[:vagrant_developer][:screenfile_destination] do
  action :create
  owner "vagrant"
  group "vagrant"
  source node[:vagrant_developer][:screenfile_source] 
end

directory "/home/vagrant/.buildout" do
    action :create
    owner "vagrant"
    group "vagrant"
    mode "0775"
end

link "/home/vagrant/.buildout/default.cfg" do
    action :create
    to "/var/www/.buildout/default.cfg"
end
