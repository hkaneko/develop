#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "apt-get update"

script "add_user" do
        interpreter "bash"
        user            "root"
        code <<-EOL
                ADMIN_USER=chef
                echo 'auth required pam_wheel.so group=wheel' >> /etc/pam.d/su
                addgroup --gid 11 wheel
                useradd $ADMIN_USER -G wheel
                echo '%wheel  ALL=(ALL)       NOPASSWD: ALL' >> /etc/sudoers
        EOL
end
