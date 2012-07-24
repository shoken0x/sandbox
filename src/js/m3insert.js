var fs = require('fs'),
    xml2js = require('xml2js');

var assert = require('assert');
var db_name = 'test';
var coll_name = 'xml_test';
var serverOptions = {
  'auto_reconnect': true,
  'poolSize': 100
};
var file_dir = '/root/fujisaki/xml/scratch_600/';

var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});


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
              console.log(data);
              //insertXml(files, data, db)
            });
          });
        });
      });
    });
  });
});


function insertXml(files, data, db){
  parser.parseString(data, function (err, result) {
    //先頭に_idを追加
    var result_clone = {};
    result_clone['_id'] = new db.bson_serializer.ObjectID();
    for (var i in result){
      result_clone[i] = result[i];
    }
    //xml fieldを追加
    result_clone['xml'] = data.toString();

    collection.insert(result_clone, function() {
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
} 
