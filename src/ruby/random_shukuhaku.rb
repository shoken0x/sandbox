require 'faker'
require 'faker/japanese'
require 'active_support/all'
Faker::Config.locale = 'ja'

last_names = Array.new(8) { Faker::Japanese::Name.last_name }
hotel_names = ["旅館", "ホテル", "ユースホテル", "ゲストハウス"]

kaiin_no_array = (1..10000).to_a
kaiin_hash = {}
(1..200).each {
                idx = rand(kaiin_no_array.size)
                kaiin_no = kaiin_no_array[idx]
                kaiin_no_array.delete_at(idx)
                kaiin_hash[kaiin_no] = Faker::Japanese::Name.name
                kaiin_hash
              }

kaiin_no = kaiin_hash.to_a.map{ |h| h[0] }


1000.times {
  start_date = Faker::Date.between(from: '2017-04-01', to: '2023-03-31')
  end_date = start_date + rand(1..3).days
  no = kaiin_no.sample
  puts "#{last_names.sample}#{hotel_names.sample},#{no},#{kaiin_hash[no]},#{start_date},#{end_date},#{(end_date - start_date).to_i},#{start_date - rand(1..10).days}"
}
