'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

user = new Schema
    firstname:
        type: String
        trim: true
        required: false
    lastname:
        type: String
        trim: true
        required: false
    email:
        type: String
        trim: true
        required: true
    password:
        type: String
        trim: true
    role:
        type: Number
        trim: true,
        required: true
        default: 1
    status:
        type: Number
        trim: true
        default: 0
    created_at:
        type: Date
        required: true
        default: Date.now
    updated_at:
        type: Date
        required: true
        default: Date.now
,
    collection: 'UserModel'

module.exports = mongoose.model 'UserModel', user
