#
# Cookbook Name: basebox
# Recipe Name: _apps_dir
#
# Setup base dir for app deployment
#
# IMPORTANT: It assumes node["basebox"]["apps_user"] user already exists
#

def user_exists?(username)
  !!Etc.getpwnam(username) rescue false
end

unless user_exists? node["basebox"]["apps_user"]
  include_recipe "basebox::_users"
end

directory node["basebox"]["apps_dir"] do
  mode "2775"
  owner node["basebox"]["apps_user"]
  group node["basebox"]["apps_user"]
  action :create
  recursive true
end