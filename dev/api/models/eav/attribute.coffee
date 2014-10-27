'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

attribute = new Schema
    name:
        type: String
        trim: true
        required: true
    canonical_name:
        type: String
        trim: true
        required: true
    label: 
        type: String
        trim: true
        required: true
    help_text:
        type: String
        trim: true
        required: false
    required: 
        type: String
        trim: true
        required: true
,
    collection: 'AttributeModel'

module.exports = mongoose.model 'AttributeModel', attribute
