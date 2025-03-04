require 'date'
require 'faker'

# 日付の範囲を定義
date_ranges = [
  { start_date: Date.new(2017, 4, 1), end_date: Date.new(2018, 3, 31), count: 500 },
  { start_date: Date.new(2018, 4, 1), end_date: Date.new(2019, 3, 31), count: 1200 },
  { start_date: Date.new(2019, 4, 1), end_date: Date.new(2020, 3, 31), count: 1500 },
  { start_date: Date.new(2020, 4, 1), end_date: Date.new(2021, 3, 31), count: 1800 },
  { start_date: Date.new(2021, 4, 1), end_date: Date.new(2022, 3, 31), count: 2000 },
  { start_date: Date.new(2022, 4, 1), end_date: Date.new(2023, 3, 31), count: 3000 }
]

# テキストファイルに書き出す
file = File.open('random_dates.txt', 'w')
date_ranges.each do |range|
  (1..range[:count]).each do |_i|
    date = Faker::Date.between(from: range[:start_date], to: range[:end_date])
    file.write(date.strftime('%Y/%m/%d') + "\n")
  end
end
file.close
