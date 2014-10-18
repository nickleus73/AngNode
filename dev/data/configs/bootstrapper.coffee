'use strict'

path = require 'path'

Bootstrapper = require path.resolve './node_modules/angnode-server/lib/bootstrapper'

module.exports = class Bootstrap extends Bootstrapper
    initConfig: ->
        console.log 'MA CONF'
        config = require './application.json'
        @config = @extendConfig config
        return
