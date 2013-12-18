#
# Cookbook Name: basebox
# Recipe: default
#

include_recipe "basebox::_package_update"
include_recipe "basebox::_users"
include_recipe "basebox::_apps_dir"
include_recipe "basebox::_tools"