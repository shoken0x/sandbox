var fs = require('fs');
var file_dir = '/root/fujisaki/xml/scratch_1000/';
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
        fs.open(file_dir + file, "r", 0666, function (err, file) {
          if (err) throw err;
          fs.close(file, function (error) {
            console.log("close = " + file)
            fs.readFile(file_dir + file, function (err, data) {
              collection.insert(file, function (err, result) {
                console.log("insert = " + result)
                collection.count(function(err, count) {
                  console.log("count = " + count);
                  if(count >= files.length){
                    db.close();
                    console.log("files.length = " + files.length);
                    console.log("count = " + count + " :process.exit");process.exit()
                  } 
                })
              });
            });
          });
        });
      });
    });
  });
});

