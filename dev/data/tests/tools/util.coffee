'use strict'

assert = require 'assert'
request = require 'request'

base_url = 'http://192.168.33.10:3000'

module.exports = ( ->
    {
        api:
            get: (url) ->
                ->
                    request.get {
                        url: base_url + url
                        json: true
                    }, @callback
                    return
            post: (url, data) ->
                ->
                    d = {
                        form: data,
                        json: true
                    }
                    request.post base_url + url, d, @callback
                    return
        test:
            status: (code) ->
                (e, res) ->
                    assert.equal res.statusCode, code
            noError: ->
                (e) ->
                    assert.isNotNull e
            msgCode: (code) ->
                (e, res, body) ->
                    assert.equal body.msg, code
    }
)()
