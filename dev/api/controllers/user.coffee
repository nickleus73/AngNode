'use strict'

_ = require 'underscore'

module.exports = (app) ->
    logger = app.get 'logger'

    constants = app.get 'CONSTANTS_TYPE'

    app.post '/api/v1/add/user/', (req, res) ->
        b = req.body
        user = app.get('get_model') 'user'

        if _.isEmpty b
            res.status(200).send {
                msg: 'NO_DATA_SEND'
                type: constants.WARNING
            }
            return
        else
            user.findOne {
                email: b.email
            }, (e, u) ->
                if e isnt null
                    logger.warn 'Unexptected error occured', e

                    res.status(500).rend {
                        msg: 'UNEXPECTED_ERROR_OCCURRED'
                        type: constants.CRITICAL
                        data:
                            error: e
                    }
                else
                    if u isnt null
                        res.status(200).send {
                            type: constants.WARNING
                            msg: 'EMAIL_ALREADY_EXIST'
                        }
                    else
                        new user(b).save (e, u) ->
                            if e isnt null
                                if e.name is 'ValidationError'
                                    res.status(200).send {
                                        type: constants.WARNING
                                        msg: 'VALIDATION_ERROR'
                                        data:
                                            msg: e.message
                                            error: e.errors
                                    }
                                else
                                    logger.warn 'Unexptected error occured', e

                                    res.status(500).send {
                                        msg: 'UNEXPECTED_ERROR_OCCURRED'
                                        type: constants.CRITICAL
                                        data:
                                            error: e
                                    }
                            else
                                res.status(200).send {
                                    msg: 'ACCOUNT_CREATED'
                                    type: constants.SUCCESS
                                    data: u
                                }
                return

        app.get '/api/v1/get/users/', (req, res) ->
            user = app.get('get_model') 'user'

            user.find (e, u) ->
                if e isnt null
                    logger.warn 'Unexptected error occured', e

                    res.status(500).send {
                        msg: 'UNEXPECTED_ERROR_OCCURRED'
                        type: constants.CRITICAL
                        data:
                            error: e
                    }
                else
                    res.status(200).send {
                        msg: 'USERS_FOUND'
                        type: constants.SUCCESS
                        data: u
                    }
            return

        app.post '/api/v1/get/user/', (req, res) ->
            user = app.get('get_model') 'user'

            b = req.body

            if _.isEmpty b
                res.status(200).send {
                    msg: 'NO_DATA_SEND'
                    type: constants.WARNING
                }
            else
                user.findOne b, (e, u) ->
                    if e isnt null
                        logger.warn 'Unexptected error occured', e

                        res.status(500).send {
                            msg: 'UNEXPECTED_ERROR_OCCURRED'
                            type: constants.CRITICAL
                            data:
                                error: e
                        }
                    else
                        if u is null
                            res.status(200).send {
                                msg: 'USER_NO_FOUND'
                                type: constants.SUCCESS
                                data: null
                            }
                        else
                            res.status(200).send {
                                msg: 'USER_FOUND'
                                type: constants.SUCCESS
                                data: u
                            }
            return
    return
