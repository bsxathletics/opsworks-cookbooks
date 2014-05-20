node[:deploy].each do |application, deploy|
  Chef::Log.error('in bsx qa recipe')
  Chef::Log.error(application)
  Chef::Log.error(deploy)
  branches = %x(git branch -l)
  branches.each do |branch|
    branch_deploy do
      deploy_data deploy
      branch_name branch
      app application
    end
  end
end
