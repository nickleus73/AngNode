module.export = (grunt) ->
    require('load-grunt-tasks')(grunt)
    
    grunt.initConfig
        coffee: 
            compile: 
                options: 
                    bare: true
                files: {}
        flo:
            serve:
                options:
                    port: 9999
                    dir: './'
                    glob: []
                    resolvers: []
            
        
        
    grunt.registerTask 'default', ['flo']