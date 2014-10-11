'use strict'

describe 'anConfig', ->
    $configProvider = null

    $config = null

    beforeEach ->
        config_module = angular.module 'test.config', ->

        config_module.config (configProvider) ->
            $configProvider = configProvider
            return

        module 'anConfig', 'test.config'

        inject ->
        return

    beforeEach ->
        inject ($injector) ->
            $config = $injector.get '$config'
            return
        return

    it 'config:setPath should be function', ->
        expect(typeof $configProvider.setPath).toBe 'function'
        return

    it 'config:getPath should be function', ->
        expect(typeof $configProvider.getPath).toBe 'function'
        return

    it 'config:getPath should be a path', ->
        expect($configProvider.getPath()).toEqual 'var/data/config.json'
        return

    it 'config:setPath should be changed', ->
        $configProvider.setPath 'path/to/new/config.json'

        expect($configProvider.getPath()).toEqual 'path/to/new/config.json'
        return

    it 'Factory $config:loadResources should be function', ->
        expect(typeof $config.loadResources).toBe 'function'
        return

    it 'Factory $config:data should be equal null', ->
        expect($config.data).toBe null
        return
    return
