var fs = require('fs'),
    xml2js = require('xml2js');

var assert = require('assert');
var db_name = 'test';

//var coll_name = 'xml';
var coll_name = 'xml_test';
var serverOptions = {
  'auto_reconnect': true,
  'poolSize': 100
};
var file_dir = '/root/fujisaki/xml/scratch_600/';
//var file_dir = '/usr/local/xmlmongo-node/xml/';

var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});

var mongo = require('mongodb');
var db = new mongo.Db(db_name, new mongo.Server('localhost', 
                                                mongo.Connection.DEFAULT_PORT, 
                                                serverOptions), {});


console.log(new Date());

//insert
db.open(function() {
  db.collection(coll_name, function(err, collection) {
    fs.readdir(file_dir,function(err,files){
      files.forEach (function(file){
        //非同期でファイルオープンする場合、OSの制限に注意する
        fs.readFile(file_dir + file,function (err, data) {
          if (err) throw err;
          //insert
          parser.parseString(data, function (err, result) {
            //先頭に_idを追加
            var result_clone = {};
            result_clone['_id'] = new db.bson_serializer.ObjectID();
            for (var i in result){
              result_clone[i] = result[i];
            }
            //xml fieldを追加
            result_clone['xml'] = data.toString();
            //safe:trueを指定して、insert後にcountを実行
            collection.insert(result_clone, {safe:true}, function(err, result) {
              collection.count(function(err, count) {
                //console.log("db.count() = " + count);
                if(count >= files.length){
                  db.close();
                  console.log(new Date());
                  console.log("process.exit");process.exit();
                }
              });
            });
          });
        });
      });
    });
  });
});
