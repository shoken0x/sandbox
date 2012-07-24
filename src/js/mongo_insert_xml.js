var fs = require('fs'),
    xml2js = require('xml2js');

//var parser = new xml2js.Parser({explicitRoot:true,mergeAttrs:true});
//var parser = new xml2js.Parser({explicitRoot:true});
var parser = new xml2js.Parser({explicitRoot:true,
                                mergeAttrs:true,
                                ignoreAttrs:false});

var mongo = require('mongodb');
var db = new mongo.Db('test', new mongo.Server('localhost', mongo.Connection.DEFAULT_PORT, {}), {});

var stack = new Array();
function getLastField(e){
  for (i in e) {
    if(e.constructor != Array) {
      //if(stack.length > 0) console.log("i = " + stack.join('.') + '.'+ i);
      //else console.log("i = " + i)
    }
    if (typeof e[i] == "object"){
      if(e.constructor != Array) stack.push(i);
      arguments.callee(e[i]);
    }else{
      console.log("i = " + stack.join('.') + '.'+ i);
    }
  }
  stack.pop();
}

//insert
//fs.readFile('/usr/local/xmlmongo-node/xml/002.xml', function(err, data) {
fs.readFile('/root/fujisaki/xml/sample/001.xml', function(err, data) {
    parser.parseString(data, function (err, result) {
      db.open(function() {
        db.collection('xml_test', function(err, collection) {
          //add xml field
          result['xml'] = data.toString();
          collection.insert(result, function() {
            console.log(result);
            console.log("insert success");
            db.close();
          });
        });
      });
      
      //console.dir(result);
      console.log('Done');
      //console.log(getLastField(result));
    });
});
