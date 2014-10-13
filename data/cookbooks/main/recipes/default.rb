execute "Install git" do
    command "apt-get update"
    user "root"
end

execute "Install git" do
    command "apt-get -y install git"
    user "root"
end

execute "Clean node_modules" do
    if File.directory?('/var/www/html/node_modules')
        command "cd /var/www/html/ && rm -R node_modules && mkdir node_modules"
        user "vagrant"
    end
end

execute "Clone andnode-server" do
    command "cd /var/www/html/node_modules && git clone https://github.com/nickleus73/angnode-server.git && cd .."
    user "vagrant"
end

execute "Install coffeescript" do
    command "npm install -g coffee-script"
    user "root"
end

execute "Install grunt-cli" do
    command "npm install -g grunt-cli"
    user "root"
end

execute "Install bower" do
    command "npm install -g bower"
    user "root"
end

execute "Install dependancies" do
    command "cd /var/www/html/node_modules/angnode-server/ && npm install"
    user "vagrant"
end
