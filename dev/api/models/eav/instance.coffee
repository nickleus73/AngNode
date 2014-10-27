'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

instance = new Schema
    name:
        type: String
        trim: true
        required: false
        index:
            unique: true
    type_id: 
        type: Schema.Types.ObjectId
        ref: 'TypeModel'
    created_at:
        type: Date
        required: true
        default: Date.now
    updated_at:
        type: Date
        required: true
        default: Date.now
,
    collection: 'InstanceModel'

module.exports = mongoose.model 'InstanceModel', instance
