if default[application][:env] == "production"
    Chef::Log.info('Using production deploy')
else
    Chef::Log.info('Using QA deploy')
    default[:deploy][application][:deploy_to] = "/srv/www/#{application}/branches/#{branch_name}"
end

default[:deploy][application][:current_path] = "#{node[:deploy][application][:deploy_to]}/current"
