#
# Cookbook Name: basebox
# Recipe Name: _users
#
# Setup default users, groups and sudoers for
# deployment purposes
#

include_recipe "users"

user_account node["basebox"]["apps_user"] do
  comment "apps runner"
end

user_account node["basebox"]["deploy_user"] do
  comment "deployer"
  ssh_keys node["basebox"]["deploy_keys"]
end

user_account node["basebox"]["admin_user"] do
  comment "sysadmin"
  ssh_keys node["basebox"]["admin_keys"]
end

group node["basebox"]["apps_user"] do
  action :modify
  members [
    node["basebox"]["apps_user"],
    node["basebox"]["admin_user"],
    node["basebox"]["deploy_user"]
  ]
end

node.default["authorization"]["sudo"]["groups"] = [
  "sudo",
  node["basebox"]["admin_user"],
  node["basebox"]["deploy_user"]
]

node.default["authorization"]["sudo"]["paddwordless"] = true

include_recipe "sudo"