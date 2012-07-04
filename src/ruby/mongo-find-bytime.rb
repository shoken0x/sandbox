##
## gem intall mongo
##
require 'mongo'
require 'time'

db_name='test'
coll_name='time_insert'

## 接続処理
db = Mongo::Connection.new.db(db_name)
coll = db.collection(coll_name)

time_condition = Time.parse('2012-07-04')
puts "where time > #{time_condition}"

db[coll_name].find({:time => {"$gt" => time_condition}}).each{ |doc|
  p doc
}
puts

time_condition = Time.parse('2012-07-04 07:01:35 UTC')
puts "where time > #{time_condition}"

db[coll_name].find({:time => {"$gt" => time_condition}}).each{ |doc|
  p doc
}

db.connection.close
