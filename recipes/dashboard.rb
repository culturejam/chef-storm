#
# Cookbook Name::       storm
# Description::         Base configuration for storm
# Recipe::              nimbus
# Author::              Ticean Bennett (ticean@promojam.com)
#
# Copyright 2010, PromoJam, Inc.
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
include_recipe 'runit'

directory('/etc/sv/storm-ui/env'){ owner 'root' ; action :create ; recursive true }
runit_service "storm-ui" do
  run_state     node[:storm][:nimbus][:dashboard][:run_state]
  options       node[:storm]
end

announce(:storm, :dashboard, :port => node[:storm][:nimbus][:dashboard_port])
