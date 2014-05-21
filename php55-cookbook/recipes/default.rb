#
# Author:: Adar Porat(<adar.porat@gmail.com>)
# Cookbook Name:: php55
# Attribute:: default
##
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
Chef::Log.info('Platform: '+node[:platform])
case node[:platform]

  when "ubuntu"
    include_recipe "apt"
    apt_repository "ondrej/php5" do
      uri "#{node['php55']['ondrej']['uri']}"
      distribution "#{node['php55']['ondrej']['distribution']}"
      components ['all']
      action :add
    end

    include_recipe "php"
end
