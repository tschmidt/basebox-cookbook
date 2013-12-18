#
# Cookbook Name: basebox
# Recipe Name: _tools
#
# Install basic sysadmin/devops tools
#

include_recipe "curl"
include_recipe "htop"
include_recipe "git"
include_recipe "tmux"