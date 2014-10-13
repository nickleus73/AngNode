execute "Install python-software-properties" do
    command "apt-get install -y python-software-properties"
    user "root"
end

execute "Install python" do
    command "apt-get install -y python"
    user "root"
end

execute "Install g++" do
    command "apt-get install -y g++"
    user "root"
end

execute "Install make" do
    command "apt-get install -y make"
    user "root"
end

execute "Install build-essential" do
    command "apt-get install -y build-essential"
    user "root"
end
