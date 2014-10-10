module.exports = (grunt) ->
    require('load-grunt-tasks')(grunt)
    
    grunt.initConfig
        coffee: 
            compile: 
                options: 
                    bare: true
                files: {}
        copy:
            dist:
                files: [
                    { expand: true, flatten: true, filter: 'isFile', src: 'dev/public/*.html', dest: 'public/' }
                ]
        flo:
            serve:
                options:
                    port: 9999
                    dir: './'
                    glob: []
                    resolvers: [{
                        files: [
                            'dev/public/*.html'
                        ]
                        tasks: ['copy:dist']
                        callback:
                            reload: true
                    }] 
                    
    grunt.registerTask 'default', ['flo']