#
# Cookbook Name:: my_cookbook
# Recipe:: default
#
# Copyright 2014, BjerkNet
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'build-essential'
include_recipe 'chef-client'
include_recipe 'apt'
include_recipe 'ntp'
include_recipe 'nginx'

message = node['my_cookbook']['message']
Chef::Log.info("** saying what I was told to say: #{message}")


# deploy your sites configuration from the files/ driectory in your cookbook
cookbook_file "#{node['nginx']['dir']}/sites-available/local.gracebiblestudies.com" do
  owner "root"
  group "root"
  mode  "0644"
end

# enable your sites configuration using a definition from the nginx cookbook
nginx_site "local.gracebiblestudies.com" do
  enable true
end
