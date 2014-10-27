'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

attribute_value = new Schema
    instance_id:
        type: String
        trim: true
        required: false
    attribute_id:
        type: String
        trim: true
        required: true
    value_id:
        type: String
        trim: true
        required: true
,
    collection: 'AttributeValueModel'

module.exports = mongoose.model 'AttributeValueModel', attribute_value
