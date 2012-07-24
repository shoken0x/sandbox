var mongo = require('mongodb'),
  Server = mongo.Server,
  Db = mongo.Db;

var server = new Server('localhost', 27017, {});
var db = new Db('test', server, {});

db.open(function(err, db) {
  console.log("DB name: " + db.databaseName);
  db.collection('json', function(err, collection) {
    console.log("Collection name: " + collection.collectionName);
    
    collection.insert({"a":9991}, {safe: true},function(err,doc) {
      console.log("insert success");
    });
    var my_id = new db.bson_serializer.ObjectID();
    collection.insert({_id:my_id, name:'fujisaki'}, {safe: true}, function(err, doc){
      console.log("insert success2");
    });
    collection.find().toArray(function(err, doc) {
      console.log(doc);
    });

  });
});
