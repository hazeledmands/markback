fs = require "fs"
path = require "path"
Coffee = require "coffee-script"
Q = require "q"
Jsdom = require "jsdom"

compileMarkback = Q.nfcall(fs.readFile, path.join(__dirname, './markback/markback.coffee')).then (coffeeSource) ->
  Q.fcall Coffee.compile, coffeeSource.toString 'utf-8'

convertHtml = (html) ->
  compileMarkback.then (markback) ->
    deferred = Q.defer()
    Jsdom.env {
      src: markback
      html
      done: deferred.makeNodeResolver()
    }
    deferred.promise
  .then (window) ->
     Q.fcall -> window.Markback()

module.exports = {convertHtml}
