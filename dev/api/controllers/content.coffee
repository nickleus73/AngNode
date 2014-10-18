'use strict'

module.exports = (app) ->
    app.get '/api/get/content/:type/:id', (req, res, next) ->
        res.status(200).send {
            code: 'SUCCESS'
        }
        return
    app.get '/api/get/contents/:type', (req, res, next) ->
        res.status(200).send {
            code: 'SUCCESS'
        }
        return
    return
