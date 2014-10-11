anConfig = angular.module 'anConfig', Array

config_params = {
    path: 'var/data/config.json'
}

anConfig.provider 'config', ->
    new class Config
        $get: ->
            config_params

        setPath: (path) ->
            config_params.path = path
            @
        getPath: ->
            @$get().path

anConfig.factory '$config', ->
    new class ConfigFactory
        data: null

        loadResources: ->
            return
