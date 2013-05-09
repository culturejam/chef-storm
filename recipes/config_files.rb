#
# Cookbook Name::       storm
# Description::         create storm config files
# Recipe::              config_files
# Author::              Ticean Bennett <ticean@promojam.com>
#
# Copyright 2012, PromoJam, Inc.
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

# Configure the various addrs for binding
node[:storm][:listen_addr] = private_ip_of(node)
node[:storm][:rpc_addr]    = private_ip_of(node)

# Discover the nimbus, assuming it's a) announced and b) converged.
nimbus_ip = discover!(:storm, :nimbus).node.ipaddress
node[:storm][:nimbus][:ip] = nimbus_ip

# Discover zookeepers, assuming they've a) announced and b) converged.
zookeeper_ips = discover_all(:zookeeper, :server).sort_by{|s| s.node.name }.map{|s| s.node.ipaddress }.uniq
node[:storm][:zookeeper_ips] = zookeeper_ips


template "#{node[:storm][:home_dir]}/conf/storm.yaml" do
  source        "storm.yaml.erb"
  owner         "root"
  group         "root"
  mode          "0644"
  variables({   :nimbus_ip        => node[:storm][:nimbus][:ip],
                :zookeeper_ips    => node[:storm][:zookeeper_ips],
                :supervisor_ports => node[:storm][:supervisor][:ports]
    })
end

template "#{node[:storm][:home_dir]}/log4j/storm.log.properties" do
  source        "log4j/storm.log.properties.erb"
  owner         "root"
  group         "root"
  mode          "0644"
  variables({   :log_dir => node[:storm][:log_dir] })
end

# Symlink config for root user & storm user
# TODO: Do this for other users
['/root'].each do |home_dir|
  link "#{home_dir}/.storm" do
    to          "#{node['storm']['home_dir']}/conf"
    action      :create
  end
end
