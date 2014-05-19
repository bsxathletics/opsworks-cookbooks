node[:deploy].each do |application, deploy|
    Chef::Log.error('in bsx qa recipe')
    opsworks_deploy_user do
        deploy_data deploy
    end

end
