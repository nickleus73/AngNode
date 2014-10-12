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
