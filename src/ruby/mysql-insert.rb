##
## gem install ruby-mysql 
##
require 'mysql'
username = 'root'
password = ''
database = 'mysql'

db = Mysql.connect('localhost', username, password, database)

puts sql_create_db = 'CREATE DATABASE IF NOT EXISTS test'
puts sql_create_table = 'CREATE TABLE IF NOT EXISTS test.insert_time(time text);'
puts sql_insert = "INSERT INTO test.insert_time VALUES('#{Time.now.to_s}')"
puts sql_select = "SELECT time FROM test.insert_time"

db.query(sql_create_db)
db.query(sql_create_table)
db.query(sql_insert)
results = db.query(sql_select)

puts
puts '|insert_time|'
results.each do |rows|
  puts rows
end
