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
var file_dir = '/root/fujisaki/xml/scratch/';
//var file_dir = '/usr/local/xmlmongo-node/xml/';

var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});

var mongo = require('mongodb');
var db = new mongo.Db(db_name, new mongo.Server('localhost', 
                                                mongo.Connection.DEFAULT_PORT, 
                                                serverOptions), {});

//insert
function insert_files(collection){
  fs.readdir(file_dir,function(err,files){
    //console.log(files);
    var count = 1;
    var condition = 1;

    files.forEach (function(file){
      //console.log(file);
      var data = fs.readFileSync(file_dir + file);
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
        //console.dir(result_clone);

        collection.insert(result_clone, function() {
          //console.log('count = ' + count);
          //console.log('files.length = ' + files.length);
          if(count == condition){
            console.log("insert success" + file +": count = " + count);
            if(condition == 1){
              condition = 100;
            }else{
              condition += 100;
            }
          }
          //if (count >= files.length){
          //  console.log(new Date());
          //  setTimeout(process.exit(),10000);
          //}
          count++;
        });
      });
    });
  });
}

console.log(new Date());
db.open(function() {
  db.collection(coll_name, function(err, collection) {
    insert_files(collection); 
  });
});
    


