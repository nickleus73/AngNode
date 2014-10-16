'use strict'

module.exports = (app) ->
    app.get '/api/v1/get/users', (req, res, next) ->
        res.status(200).send {
            code: 'GET USERS'
        }
        return

    app.get '/api/v1/get/user/:id', (req, res, next) ->
        return
    return
