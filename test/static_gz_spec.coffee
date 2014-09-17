staticGz = require "../lib/static_gz"
expect   = require "expect.js"
describe "static_gz", ->
  
    it "do nothing for none gz files", (done) ->
        test_spec = [
          "a.txt",
          "a.html",
          "a.gz.txt",
          ".gz",
          "a.b.txt"
        ]
        compressed = staticGz.compressed()
        for item in test_spec
            req = { url: item}
            res = {}
            res.set = (header) ->
                res.header = header
            compressed(req, res)
            (expect res.header).to.eql undefined
        done()
      
    it "set response header for gz", (done) ->
        test_spec = [
            ["a.txt.gz", "text/plain"],
            ["a.html.gz", "text/html"],
            ["a.b.txt.gz", "text/plain"],
            ["a.gz", "text/plain"]
        ]
        

        compressed = staticGz.compressed()
        for item in test_spec
            req = { url: item[0] }
            res = {}
            res.set = (header) ->
                res.header = header
            compressed(req, res)
            (expect res.header['Content-Type']).to.eql item[1]

        done()
