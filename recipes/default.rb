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

package "vim" do
  action :install
end

package "screen" do
  action :install
end

package "python-easyinstall" do
  action :install
end

package "setuptools-git" do
  action :install
  provider "easy_install_package"
end

file node[:vagrant_developer][:gitignore_destination] do
  action :create
  owner "vagrant"
  group "vagrant"
  source node[:vagrant_developer][:gitignore_source]
end

file node[:vagrant_developer][:screenfile_destination] do
  action :create
  owner "vagrant"
  group "vagrant"
  source node[:vagrant_developer][:screenfile_destination] 
end
