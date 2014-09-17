express = require "express"

module.exports=

    compressed: () ->
        (req, res, next) ->
            filename = req.url
            index = filename.lastIndexOf(".")
          
            if index > 0 and filename.substr(index) == ".gz"
                shortname = filename.substr(0, index)
                if shortname.indexOf(".") > 0
                    res.set {
                        'Content-Type': express.static.mime.lookup(shortname),
                        'Content-Encoding':'gzip'
                    }
                else
                    # default to text/plain
                    res.set {
                        'Content-Type': 'text/plain',
                        'Content-Encoding':'gzip'
                    }
            next() if next?
