execute "Clean node_modules" do
    if File.directory?('/var/www/html/node_modules')
        command "cd /var/www/html/ && rm -R node_modules && mkdir node_modules"
        user "root"
    else
        command "cd /var/www/html/ && mkdir node_modules"
        user "root"
    end
end

execute "Clone andnode-server" do
    command "cd /var/www/html/node_modules && git clone https://github.com/nickleus73/angnode-server.git && cd .."
    user "root"
end

execute "Install vows" do
    command "npm install -g vows"
    user "root"
end

execute "Install forever" do
    command "npm install -g forever"
    user "root"
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

execute "Install dependancies and compile the module angnode-server" do
    command "cd /var/www/html/node_modules/angnode-server/ && npm install && grunt force"
    user "root"
end

execute "Clear npm cache" do
    command "rm -rf ~/.npm && npm cache clean"
    user "root"
end

execute "Install dependancies and compile project" do
    command "cd /var/www/html/ && npm install && grunt force"
    user "root"
end
