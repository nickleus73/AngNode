execute "Install git" do
    command "sudo apt-get -y install git"
    user "root"
end

execute "Clone andnode-server" do
    if File.directory?('./angnode-server')
        command "cd /var/www/html/node_modules && sudo rm -R angnode-server && git clone https://github.com/nickleus73/angnode-server.git && cd .."
        user "root"
    else
        command "cd /var/www/html/node_modules && git clone https://github.com/nickleus73/angnode-server.git && cd .."
        user "root"
    end
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
