fs = require "fs"
path = require "path"
Coffee = require "coffee-script"
Q = require "q"
Jsdom = require "jsdom"
argv = require("optimist")
        .usage('Usage: $0 <htmldocument> <id>')
        .demand(2)
        .argv

[htmlDocument, id] = argv._

loadSource = Q.nfcall(fs.readFile, path.join(__dirname, 'markback.coffee'))

loadSource = loadSource.then (file) -> 
  deferred = Q.defer()
  Jsdom.env {
    html: htmlDocument,
    src: Coffee.compile(file.toString('utf-8')),
    done: deferred.makeNodeResolver()
  }
  return deferred.promise

loadSource = loadSource.then (window) ->
  console.log window.Markback(id)

loadSource.done()
