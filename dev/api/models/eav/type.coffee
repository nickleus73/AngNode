'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

type = new Schema
    name:
        type: String
        trim: true
        required: true
,
    collection: 'TypeModel'

module.exports = mongoose.model 'TypeModel', type
