include_recipe 'apache2'

node[:mod_php5_apache2][:packages].each do |pkg|
  package pkg do
    action :install
    ignore_failure(pkg.to_s.match(/^php-pear-/) ? true : false) # some pear packages come from EPEL which is not always available
  end
  Chef::Log.info('Installed package: ' + pkg.to_s)
  if (pkg.to_s.match(/^php5*/))
    bash "sudo add-apt-repository ppa:ondrej/php5" do
      #sudo add-apt-repository ppa:ondrej/php5 && sudo apt-get update && sudo apt-get install python-software-properties && sudo apt-get install php5 && sudo service apache2 restart"
    end
  end
end

include_recipe 'apache2::mod_php5'