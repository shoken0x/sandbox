var fs = require('fs');
var xml2js = require('xml2js');
var assert = require('assert');
var mecab = require('mecab');
var conf = require('../conf/config').create();

var db_name = 'test';
var coll_name = 'xml';
//var coll_name = 'xml_test';
var serverOptions = {
  'auto_reconnect': true,
  'poolSize': 100
};
//var file_dir = '/root/fujisaki/xml/sample/';
//var file_dir = '/root/fujisaki/xml/scratch_600/';
var file_dir = '/root/fujisaki/xml/scratch/';

var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});

var mongo = require('mongodb');
var db = new mongo.Db(db_name, new mongo.Server('localhost', 
                                                mongo.Connection.DEFAULT_PORT, 
                                                serverOptions), {});

var condition = 0;

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

            //検索のためにtagsに追加
            result_clone['tags'] = insertTags(result_clone);

            //insert実行後のcountと比較するためにsafe:trueを指定
            collection.insert(result_clone, {safe:true}, function(err, result) {
              collection.count(function(err, count) {
                if(count >= condition) {
                  console.log("db.count() = " + count);
                  condition += 100;
                }
                if(count >= files.length){
                  db.close();
                  console.log(new Date());
                  console.log("db.count() = " + count + "; process.exit");process.exit();
                }
              });
            });
          });
        });
      });
    });
  });
});

function insertTags(result){
  var str_array =[];
  result['tags'] = [];
  if(result[conf.xbrl] != void 0){
    var xlink_href = result[conf.xbrl][conf.link][conf.href];
    switch(true) {
      case /tdnet-rvfc/.test(xlink_href):
        str_array = [
               result[conf.xbrl][conf.tdnet_rvfc.code_]["#"],
               result[conf.xbrl][conf.tdnet_rvfc.date_]["#"],
               result[conf.xbrl][conf.tdnet_rvfc.company_]["#"],
               result[conf.xbrl][conf.tdnet_rvfc.document_]["#"],
               result[conf.xbrl][conf.tdnet_rvfc.body_]["#"]
              ];
        break;
      case /tdnet-rvdf/.test(xlink_href):
        str_array = [
               result[conf.xbrl][conf.tdnet_rvdf.code_]["#"],
               result[conf.xbrl][conf.tdnet_rvdf.date_]["#"],
               result[conf.xbrl][conf.tdnet_rvdf.company_]["#"],
               result[conf.xbrl][conf.tdnet_rvdf.document_]["#"],
               result[conf.xbrl][conf.tdnet_rvdf.body_]["#"]
              ];
        break;
      case /tdnet-qnedjpsm/.test(xlink_href):
        str_array = [
               result[conf.xbrl][conf.tdnet_qcedjpsm.code_]["#"],
               result[conf.xbrl][conf.tdnet_qcedjpsm.date_]["#"],
               result[conf.xbrl][conf.tdnet_qcedjpsm.company_]["#"],
               result[conf.xbrl][conf.tdnet_qcedjpsm.document_]["#"],
               result[conf.xbrl][conf.tdnet_qcedjpsm.body_]["#"]
              ];
        break;
      default:
        break;
    }
    for(i=0;i<str_array.length;i++){
      result['tags'] = result['tags'].concat( wakati(str_array[i]) );
    }
  }
  return result['tags'];
}

function wakati(str){
  mecab.options("-Owakati");
  var result = [];
  if(str != void 0){
    var w = mecab.parse(str); 
    result =  w[0].toString().split(' ');
  }
  return result;
}
