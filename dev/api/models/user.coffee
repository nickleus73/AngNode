'use strict'

mongoose = require 'mongoose'
bcrypt = require 'bcrypt-nodejs'

Schema = mongoose.Schema

SALT_WORK_FACTOR = 10

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
        index:
            unique: true
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

user.pre 'save', (next) ->
    user = this

    bcrypt.genSalt SALT_WORK_FACTOR, (e, s) ->
        if e isnt null
            return next e

        bcrypt.hash user.password, s, null, (e, h) ->
            if e isnt null
                return next e
            user.password = h
            next()

module.exports = mongoose.model 'UserModel', user
