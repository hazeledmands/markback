fs = require "fs"
path = require "path"
Coffee = require "coffee-script"
Q = require "q"
Jsdom = require "jsdom"

MARKBACK_FILE = path.join(__dirname, '../build/markback.js')

readMarkback = Q.nfcall(fs.readFile, MARKBACK_FILE).then (file) ->
  Q.fcall -> file.toString('utf-8')

convertHtml = (html) ->
  readMarkback.then (markback) ->
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
