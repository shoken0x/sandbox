require 'csv'
require 'date'
require 'gimei'
require 'faker'

# 1000件のデータを生成する
data = []
10_000.times do
  # 入会日をランダムに生成
  date = Faker::Date.between(from: '2017/04/01', to: Date.today)

  # 氏名とふりがなを生成
  name = Gimei.name
  name_kana = name.hiragana

  # 郵便番号をランダムに生成
  postcode = format('%07d', rand(10_000_000))

  # 都道府県と住所を生成
  address = Gimei.address
  prefecture = address.prefecture.kanji
  city_town = address.city.kanji + address.town.kanji

  # 番地をランダムに生成
  street = "'#{rand(100)}-#{rand(10)}"

  # 電話番号をランダムに生成
  phone = format('0%02d-%04d-%04d', rand(100), rand(10_000), rand(10_000))

  # メールアドレスを生成
  email = "#{name.romaji.gsub(' ', '.').downcase}@example.com"

  # 性別をランダムに生成
  gender = rand(2) == 0 ? '男性' : '女性'

  # 生年月日を生成
  birthday = Faker::Date.birthday(min_age: 18, max_age: 80)
  age = ((Date.today - birthday).to_i / 365).to_i

  # 1件のデータを配列に追加
  row = [date.strftime('%Y/%m/%d'), name.kanji, name_kana, postcode, prefecture, city_town, street, phone, email, gender,
         birthday.strftime('%Y/%m/%d'), age]
  data << row
end

# CSVファイルに出力
CSV.open('random_data.csv', 'w') do |csv|
  csv << %w[入会日 氏名 ふりがな 郵便番号 都道府県 住所 番地 電話番号 メールアドレス 性別 生年月日 年齢]
  data.each do |row|
    csv << row
  end
end
