module.exports = (grunt) ->
    require('load-grunt-tasks')(grunt)
    
    grunt.initConfig
        coffee: 
            main:
                options: 
                    bare: true
                files: {
                    'server.js': 'dev/server.coffee'
                    'dev/public/assets/dist/modules/config.js': 'dev/public/assets/app/modules/config.coffee'
                    'api/controllers/api.js': 'dev/api/controllers/api.coffee'
                    'api/models/user.js': 'dev/api/models/user.coffee'
                }
            tests:
                options:
                    bare: true
                files:
                    'var/test-public/modules/config.js': 'dev/var/test-public/modules/config.coffee'
        copy:
            dist:
                files: [
                    { expand: true, flatten: true, filter: 'isFile', src: 'dev/public/*.html', dest: 'public/' }
                    { expand: true, flatten: true, filter: 'isFile', src: 'dev/var/data/*.json', dest: 'var/data/' }
                ]
        concat:
            options:
                separator: ';'
            dist:
                src: [
                    'dev/public/assets/lib/angular/angular.js',
                    'dev/public/assets/lib/angular-route/angular-route.js',
                ]
                dest: 'public/assets/lib/lib.js'
            app:
                src: [
                    'dev/public/assets/dist/modules/config.js'
                ]
                dest: 'public/assets/lib/app.js'
        flo:
            serve:
                options:
                    port: 8000
                    dir: './'
                    glob: []
                    resolvers: [{
                        files: [
                            'dev/public/*.html'
                        ]
                        tasks: ['copy:dist']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/*.coffee',
                            'dev/api/**/*.coffee',
                            'dev/public/assets/app/modules/*.coffee',
                            'dev/var/test-public/modules/*.coffee'
                        ]
                        tasks: ['coffee:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/public/assets/lib/**/*.js'
                        ]
                        tasks: ['coffee:*']
                        callback:
                            reload: true
                    }] 

    grunt.registerTask 'default', ['flo']
    
    grunt.registerTask 'force', ['coffee', 'concat', 'copy']
