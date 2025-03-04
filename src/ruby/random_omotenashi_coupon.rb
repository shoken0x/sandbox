require 'faker'
require 'faker/japanese'
require 'active_support/all'
Faker::Config.locale = 'ja'

shisetsu_names = ["KO", "有限会社 酒造店", "精肉店", "朝市", "(有)造場", "文化館", "古川", "まつり会館", "縁", "呉服店", "菓舗", "(有)舗"]

kaiin_no_array = (1..10000).to_a.sample(200)

def generate_numbers()
  numbers = Array.new(4){ rand(5) }
  while numbers.sum > 4 or numbers == [0, 0, 0, 0]
    numbers = Array.new(4){ rand(5) }
  end
  return numbers
end

200.times {
  idx = rand(shisetsu_names.count)
  date = Faker::Date.between(from: '2017-04-01', to: '2023-03-31')
  numbers = generate_numbers
  puts "#{date},#{kaiin_no_array.sample},#{rand < 0.8 ? "本人" : "紹介"},#{idx + 1},#{shisetsu_names[idx]},#{numbers.map{ |n| n.zero? ? "" : n }.join(',')},#{numbers.sum}"
}


