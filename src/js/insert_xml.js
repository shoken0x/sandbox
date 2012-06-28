var fs = require('fs');
var file_dir = './xml/';

fs.readdir(file_dir,function(err,files){
  console.log(files);
  files.forEach (function(file){
    var file_path = file_dir + file;
    fs.readFile(file_path, function(err, data){
                    if(err) cb(err, null);
                    // dataには読み込んだBufferが入っている
                    // toString('utf8')で文字列にする
                    console.log(data.toString('utf8'));
                });
  });
});

