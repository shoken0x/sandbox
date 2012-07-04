##
## gem intall mongo
##
require 'mongo'

db_name='test'
coll_name='insert-time' 

## 接続処理
db = Mongo::Connection.new.db(db_name)
coll = db.collection(coll_name)

coll.insert({:time => Time.now})

db[coll_name].find().each{ |doc|
  p doc
}

db.connection.close
