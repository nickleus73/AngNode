'use strict'

module.exports = (app) ->

    app.get '/api/', (req, res, next) ->
        res.status(200).send {
            code: 'SUCCESS'
        }
