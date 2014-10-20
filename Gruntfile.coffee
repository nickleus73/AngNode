module.exports = (grunt) ->
    require('load-grunt-tasks')(grunt)
    
    grunt.initConfig
        coffee: 
            main:
                options: 
                    bare: true
                files: {
                    'server.js': 'dev/server.coffee'
                    'dev/public/assets/dist/app.js': 'dev/public/assets/app/app.coffee'
                    'dev/public/assets/dist/admin.js': 'dev/public/assets/app/admin.coffee'
                    'dev/public/assets/dist/modules/config.js': 'dev/public/assets/app/modules/config.coffee'
                    'api/controllers/api.js': 'dev/api/controllers/api.coffee'
                    'api/controllers/content.js': 'dev/api/controllers/content.coffee'
                    'api/models/user.js': 'dev/api/models/user.coffee'
                    'data/fixtures/fictitious/fixture.js': 'dev/data/fixtures/fictitious/fixture.coffee'
                    'data/configs/bootstrapper.js': 'dev/data/configs/bootstrapper.coffee'
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
                    { expand: true, flatten: true, filter: 'isFile', src: 'dev/data/configs/*.json', dest: 'data/configs/' }
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
                    'dev/public/assets/dist/app.js'
                    'dev/public/assets/dist/modules/config.js'
                ]
                dest: 'public/assets/lib/app.js'
            admin:
                src: [
                    'dev/public/assets/dist/admin.js'
                ]
                dest: 'public/assets/lib/admin.js'
        less:
            dist:
                files:
                    'public/assets/css/styles.css': 'dev/public/assets/less/styles.less'
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
                            'dev/data/**/**/*.coffee',
                            'dev/public/assets/app/*.coffee',
                            'dev/public/assets/app/modules/*.coffee',
                            'dev/var/test-public/modules/*.coffee'
                        ]
                        tasks: ['coffee:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/public/assets/dist/**/*.js',
                            'dev/public/assets/lib/**/*.js'
                        ]
                        tasks: ['concat:*']
                        callback:
                            reload: true
                    }, {
                        files: [
                            'dev/public/assets/less/*.less'
                        ]
                        tasks: ['less:*']
                        callback:
                            reload: true
                    }] 

    grunt.registerTask 'default', ['flo']
    
    grunt.registerTask 'force', ['coffee', 'concat', 'copy', 'less']
