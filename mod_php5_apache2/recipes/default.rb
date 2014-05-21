include_recipe 'apache2'

node[:mod_php5_apache2][:packages].each do |pkg|
  package pkg do
    action :install
    ignore_failure(pkg.to_s.match(/^php-pear-/) ? true : false) # some pear packages come from EPEL which is not always available
  end
  Chef::Log.info('Installed package: ' + pkg.to_s)
end

include_recipe 'apt'

execute 'add php55 repo' do
  command "ruby apt_repository 'ppa:ondrej/php5' do components ['main'] end"
end

include_recipe 'apache2::mod_php5'