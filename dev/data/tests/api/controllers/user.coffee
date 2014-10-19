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
                    email: 'bibi@ndd.fr'
                    password: '123456'
                }
                'should have not error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code ACCOUNT_CREATED': util.test.msgCode 'ACCOUNT_CREATED'
                'should return user object with same email': (e, r, b) ->
                    assert.equal b.data.email, 'bibi@ndd.fr'
                    return
        suite.addBatch
            'POST /api/v1/add/user/ (email already exist)':
                topic: util.api.post '/api/v1/add/user/', {email: 'bibi@ndd.fr'}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code NO_DATA_SEND': util.test.msgCode 'EMAIL_ALREADY_EXIST'
        suite.addBatch
            'POST /api/v1/get/users/ (return an user list)':
                topic: util.api.get '/api/v1/get/users/'
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code USERS_FOUND': util.test.msgCode 'USERS_FOUND'
                'should return an array of users': (e, r, b) ->
                    assert.isArray b.data
                    assert.strictEqual b.data.length > 0, true
                    return
        suite.addBatch
            'POST /api/v1/get/user/ (get user with no data)':
                topic: util.api.post '/api/v1/get/user/', {}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code USER_FOUND': util.test.msgCode 'NO_DATA_SEND'
        suite.addBatch
            'POST /api/v1/get/user/ (get user by email)':
                topic: util.api.post '/api/v1/get/user/', {email: 'bibi@ndd.fr'}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code USER_FOUND': util.test.msgCode 'USER_FOUND'
                'should return the same email': (e, r, b) ->
                    assert.equal b.data.email, 'bibi@ndd.fr'
                    return
        suite.addBatch
            'POST /api/v1/get/user/ (get user by email by not found)':
                topic: util.api.post '/api/v1/get/user/', {email: 'bibi@free.fr'}
                'should havenot error': util.test.noError()
                'should respond code 200': util.test.status 200
                'should respond message code USER_FOUND': util.test.msgCode 'USER_NO_FOUND'
                'should return a null object': (e, r, b) ->
                    assert.isNull b.data
                    return
)()
