'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

attribute = new Schema
    value:
        type: String
        trim: true
        required: false
    type_value:
        type: String
        trim: true
        required: true
,
    collection: 'AttributeModel'

module.exports = mongoose.model 'AttributeModel', attribute
