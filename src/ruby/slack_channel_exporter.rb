require 'net/http'
require 'uri'
require 'json'

TOKEN = ENV['SLACK_API_TOKEN'].freeze
SLACK_API_BASE = 'https://slack.com/api'.freeze
headers = { 'Authorization': "Bearer #{TOKEN}" }

# チャンネル一覧を取得するAPI
fetch_all_channels_url = "#{SLACK_API_BASE}/conversations.list?limit=100"
res = Net::HTTP.get(URI.parse(fetch_all_channels_url), headers)
channel_hash = JSON.parse(res)
channels = channel_hash['channels']
channels = # 削除されたチャンネルや所属人数が0のチャンネルを除外
  channels.select do |channel|
    !channel['is_archived'] && !channel['num_members'].zero?
  end

channels.each do |channel|
  # csvで出力
  puts "#{channel['id']},#{channel['name']}"
end
