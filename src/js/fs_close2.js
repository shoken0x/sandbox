var fs = require('fs');
var xml2js = require('xml2js');
var file_dir = '/root/fujisaki/xml/scratch_600/';
var test_file = '/root/fujisaki/xml/sample/001.xml';
var assert = require('assert');

var db_name = 'test';
var coll_name = 'xml_test';
var serverOptions = {
  'auto_reconnect': true,
  'poolSize': 100
};

var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});

var mongo = require('mongodb');
var db = new mongo.Db(db_name, new mongo.Server('localhost', 
                                                mongo.Connection.DEFAULT_PORT, 
                                                serverOptions), {});

db.open(function() {
  db.collection(coll_name, function(err, collection) {
//    fs.readdir(file_dir,function(err,files){
 //     if (err) throw err;
      //files.forEach(function(file) {
       // if (err) throw err;
        fs.readFile(test_file, function (err, data) {
          //collection.insert(data, {safe:true}, function (err, result) {
          parser.parseString(data, function (err, result) {
          result['xml'] = data.toString();
          collection.insert(result, function () {
            console.log(result);
            //console.log("insert = " + result)
            collection.count(function(err, count) {
            //console.log("count = " + count);
              //if(count >= files.length){
              //  db.close();
              //  console.log("files.length = " + files.length);
              //  console.log("count = " + count + " :process.exit");process.exit()
              //} 
            })
          });
          });
        });
      //});
    //});
  });
});

