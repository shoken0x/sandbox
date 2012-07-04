##
## gem install ruby-mysql
##
require 'mysql'
username = 'root'
password = ''
database = 'mysql'

db = Mysql.connect('localhost', username, password, database)

sql = "SELECT user, host FROM mysql.user WHERE host = ?"
stmt = db.prepare(sql)

stmt.execute('localhost')
  
puts sql
puts '|user | host |'
stmt.each do |rows|
  puts rows.join ", "
end
