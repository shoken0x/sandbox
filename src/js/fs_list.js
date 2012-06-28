var fs = require('fs');
var dir = ('./xml');

fs.readdir(dir,function(err,files){
  console.log(files);
});

