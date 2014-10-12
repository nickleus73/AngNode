'use strict'

server = require 'angnode-server'

s = new server()

s.run (app, server) ->
    console.log app.get 'port'
