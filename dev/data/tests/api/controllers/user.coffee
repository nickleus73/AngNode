'use strict'

assert = require 'assert'
request = require 'request'
util = require '../../tools/util'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'POST /api/v1/add/user/ (no data sent)':
                topic: util.api.post '/api/v1/add/user/', {}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code NO_DATA_SEND': util.test.msgCode 'NO_DATA_SEND'
        suite.addBatch
            'POST /api/v1/add/user/ (validation error)':
                topic: util.api.post '/api/v1/add/user/', {email: ''}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code VALIDATION_ERROR': util.test.msgCode 'VALIDATION_ERROR'
        suite.addBatch
            'POST /api/v1/add/user/ (user added)':
                topic: util.api.post '/api/v1/add/user/', {
                    email: 'bibi@free.fr'
                    password: '123456'
                }
                'should have not error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code ACCOUNT_CREATED': util.test.msgCode 'ACCOUNT_CREATED'
                'should return user object with same email': (e, res, body) ->
                    assert.equal body.data.email, 'bibi@free.fr'
                    return
        ###suite.addBatch
            'POST /api/v1/add/user/ (email already exist)':
                topic: util.api.post '/api/v1/add/user/', {email: 'bibi@ndd.fr'}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code NO_DATA_SEND': util.test.msgCode 'EMAIL_ALREADY_EXIST'###
)()
