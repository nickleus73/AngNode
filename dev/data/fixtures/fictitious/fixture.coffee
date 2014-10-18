'use strict'
lorem = require 'lorem-ipsum'
server = require 'angnode-server'
bootstrap = require '../../configs/bootstrapper.js'

simpleWord = ->
    output = lorem {
        count: 1,
        sentenceLowerBound: 1,
        sentenceUpperBound: 1
    }
    output.substr 0, output.length - 1

console.log simpleWord()

###b = new bootstrap

s = new server

s.bootstrap(b).run (app, server) ->
    console.log 'Connected to : ' + app.get 'port'###

