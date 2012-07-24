var mongodb = require('mongodb');
var server = new mongodb.Server('localhost', mongodb.Connection.DEFAULT_PORT, {});

new mongodb.Db('test', server, {}).open(function (error, client) {
  if (error) throw error;
  var collection = new mongodb.Collection(client, 'users');
  collection.find({}, {limit:10}).toArray(function(err, docs) {
    console.dir(docs);
  });
});
