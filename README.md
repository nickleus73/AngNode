AngNode
=======

AngNode is a CMS based on some javascript technologies like nodejs or angularjs

##Prerequis##

You need install virtualbox and vagrant. Then add the plugin vagrant-omnibus with this command line : 

`vagrant plugin install vagrant-omnibus`

TODO : write more...

##Installation##

Clone the project in your work directory. Then launch the command line :

`vagrant up`

meanwhile and if you have intalled node, npm and bower, you can execute some commands in your work directory :

`npm install` to install dependencies

`bower install` to install componants

if you haven't install node, npm and bower, don't worry, you can execute these command when you are connected to you vistual machine.

So when the command `vagrant up` is finished, you can you connect to vagrant whith this command :

`vagrant ssh`

Then run this command :

`cd /var/www/html`

After, if you have execute npm and bower command, you can make it.


