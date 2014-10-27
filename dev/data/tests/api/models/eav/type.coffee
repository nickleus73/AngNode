'use strict'

assert = require 'assert'
path = require 'path'
type = require path.resolve 'api/models/eav/type'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Test the model type':
                'should have name property required': ->
                    name = type.schema.tree.name
                    assert.isTrue name.required
                    return
)()
                