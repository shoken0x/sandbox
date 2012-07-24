var fs = require('fs')
//var file_dir = '/root/fujisaki/xml/scratch_1000/';
var file_dir = '/root/fujisaki/xml/scratch_600/';
var assert = require('assert');

var db_name = 'test';
var coll_name = 'xml_test';
var serverOptions = {
  'auto_reconnect': true,
  'poolSize': 100
};

var mongo = require('mongodb');
var db = new mongo.Db(db_name, new mongo.Server('localhost', 
                                                mongo.Connection.DEFAULT_PORT, 
                                                serverOptions), {});

db.open(function() {
  db.collection(coll_name, function(err, collection) {
    fs.readdir(file_dir,function(err,files){
      if (err) throw err;
      files.forEach(function(file) {
        if (err) throw err;
        //fs.readFileSync(file_dir + file);
        fs.open(file_dir,"r", 0666, function (error, file) {
          if (err) throw err;
          fs.close(file, function (error) {
            fs.readFile(file_dir + file, function (error, data) {
              if (err) throw err;
              console.log(data);
              console.log("process.exit"); process.exit();
            });
          });
        });
      });
    });
  });
});
