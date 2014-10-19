'use strict'

path = require 'path'
fs = require 'fs'
vows = require 'vows'

config = require './config.json'

includes = config.includes

n_includes = includes.length - 1

suite = vows.describe 'AngNode Server'

includes.forEach (dir) ->
    dir = path.resolve dir

    if dir.substr -1 is '*'
        base_path = dir.substr 0, dir.length - 1

        files = fs.readdirSync base_path

        n_files = -1

        files.forEach (file) ->
            p = path.join base_path, file
            stats = fs.lstatSync(p);

            if stats.isFile() is true
                n_files++

        files.forEach (file) ->
            p = path.join base_path, file
            stats = fs.lstatSync(p);

            if stats.isFile() is true
                require(p)(suite)

            if n_includes is 0
                if n_files-- is 0
                    suite.run()

    n_includes--
