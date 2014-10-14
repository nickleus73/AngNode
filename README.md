AngNode
=======

AngNode is a CMS based on some javascript technologies like nodejs or angularjs

##Prerequis##

You need install virtualbox and vagrant.

This project, is tested on the version 4.3.10 of virtualbox and the version 1.6.3 of vagrant. 

##Installation##

Clone the project in your work directory. Then you have just to launch the next command line:

`vagrant up`

So when the command `vagrant up` is finished, you can you to connect to vagrant with this command:

`vagrant ssh`

###Warning###

Normally, the command `vagrant up` install all server and run it.

Actually, I suspect anomally when we run to the fist time the command `vagrant up` (See issue #17)

To fix this "bug", you just need to run this command :

`vagrant reload --provision`

To access to your project directory, run this command:

`cd /var/www/html`

To run the server, execute this next command:

`npm start`
