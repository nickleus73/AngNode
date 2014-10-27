'use strict'

assert = require 'assert'
path = require 'path'
attribute = require path.resolve 'api/models/eav/attribute'

module.exports = ( ->
    (suite) ->
        suite.addBatch
            'Test the model attribute':
                'should have name property required': ->
                    attr = attribute.schema.tree.name
                    assert.isTrue attr.required
                    return
                'should have canonical_name property required': ->
                    attr = attribute.schema.tree.canonical_name
                    assert.isTrue attr.required
                    return
                'should have label property required': ->
                    attr = attribute.schema.tree.label
                    assert.isTrue attr.required
                    return
                'should have help_text property required': ->
                    attr = attribute.schema.tree.help_text
                    assert.isFalse attr.required
                    return
                'should have required property required': ->
                    attr = attribute.schema.tree.required
                    assert.isTrue attr.required
                    return
)()
                