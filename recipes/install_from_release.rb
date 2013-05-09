#
# Cookbook Name::       storm
# Description::         Install From Release
# Recipe::              install_from_release
# Author::              Ticean Bennett
#
# Copyright 2012, Ticean Bennett
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

include_recipe 'storm::default'
include_recipe 'install_from'

install_from_release(:storm) do
  release_url   node[:storm][:release_url]
  home_dir      node[:storm][:home_dir]
  version       node[:storm][:version]
  has_binaries  ['bin/storm']
  action        [:install]
end
