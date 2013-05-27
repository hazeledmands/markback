module.exports = (grunt) ->
  grunt.initConfig {
    pkg: grunt.file.readJSON('package.json')
    coffee: {
      options: { join: true, sourceMap: true },
      compile: {
        files: {
          'build/<%= pkg.name %>.js': [
            'lib/markback/nodes/node.coffee',
            'lib/markback/nodes/inline.coffee',
            'lib/markback/nodes/block.coffee',
            'lib/markback/nodes/*.coffee',
            'lib/markback/markback.coffee'
          ]
        }
      }
    }
    uglify: {
      options: {
        banner: '/*! <%= pkg.name %> v<%= pkg.version %>, (c) <%= pkg.author %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
      }
      build: {
        src: 'build/<%= pkg.name %>.js'
        dest: 'build/<%= pkg.name %>.min.js'
      }
    }
  }

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.registerTask('default', ['coffee', 'uglify'])
