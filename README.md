static-gz
=========

nodejs [express] plugin to view gz file in browser directly. Help to save server disk space 

### use case
```
When I host a website providing static files, eg: doc or log files  
And I use "gzip" to compress static files to save disk space  
Then user still can view those files directly in browser as if they are not compressed
```

### how to install
npm install static-gz

### how to use
```
var staticGz = require("static-gz");
app.use(staticGz.compressed());
app.use(express.static(path.join(__dirname, 'public')));
```


[express]:http://expressjs.com/