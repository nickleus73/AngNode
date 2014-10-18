'use strict'

mongoose = require 'mongoose'

Schema = mongoose.Schema

content = new Schema
    title:
        type: String
        trim: true
        required: false
    content:
        type: String
        trim: true
        required: false
    user_id:
        type: Schema.Types.ObjectId
        ref: 'UserModel'
    type:
        type: string
        trim: true
        default: 'article'
    status:
        type: string
        trim: true
        default: 'draft'
    created_at:
        type: Date
        required: true
        default: Date.now
    updated_at:
        type: Date
        required: true
        default: Date.now
,
    collection: 'ContentModel'

module.exports = mongoose.model 'ContentModel', content
