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

createUsers = (app) ->
    user_model = app.get('get_model') 'user'

    if typeof args[2] is 'undefined'
        n = 10
    else
        n = args[2]

    console.log 'Start to create ' + n + ' users'

    n = n - 1

    while n > -1
        user = {
            firstname: simpleWord()
            lastname: simpleWord()
            email: generateEmail()
            password: simpleWord()
            status: 1
        }

        new user_model(user).save (e, u) ->
            if e isnt null
                app.get('logger').warn 'An user doesnot saved!', e
            else
                app.get('logger').info 'User saved!'
            return

        n--

    return

createPages = ->
    console.log 'Start create pages'
    return

createArticles = ->
    console.log 'Start create articles'
    return

b = new bootstrap

s = new server

s.bootstrap(b).run (app, server) ->
    console.log 'Connected to : ' + app.get 'port'

    if args.length < 2
        console.log 'Fictitions should take 2 parameters'
    else
        switch args[1]
            when 'users' then createUsers(app)
            when 'pages' then createPages(app)
            when 'articles' then createArticles(app)
    return

