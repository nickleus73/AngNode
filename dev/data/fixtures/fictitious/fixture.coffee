'use strict'
lorem = require 'lorem-ipsum'
server = require 'angnode-server'
bootstrap = require '../../configs/bootstrapper.js'

args = process.argv.slice 2

simpleWord = (n) ->
    output = lorem {
        count: 1,
        sentenceLowerBound: 1,
        sentenceUpperBound: 1
    }
    word = output.substr 0, output.length - 1

    if typeof n isnt 'undefined'
        if word.length > n
            word = word.substr 0, n

    return word.toLowerCase()

generateEmail = ->
    simpleWord() + '@' + simpleWord() + '.' + simpleWord(2)

createUsers = ->
    n = args[2] - 1
    console.log 'Start to create ' + n + ' users'

    while n > -1
        user = {
            firstname: simpleWord()
            lastname: simpleWord()
            email: generateEmail()
            password: simpleWord()
            status: 1
        }
        console.log user
        n--

    return

createPages = ->
    console.log 'Start create pages'
    return

createArticles = ->
    console.log 'Start create articles'
    return

if args.length < 2
    console.log 'Fictitions should take 2 parameters'
else
    switch args[1]
        when 'users' then createUsers()
        when 'pages' then createPages()
        when 'articles' then createArticles()

#console.log simpleWord()

###b = new bootstrap

s = new server

s.bootstrap(b).run (app, server) ->
    console.log 'Connected to : ' + app.get 'port'###

