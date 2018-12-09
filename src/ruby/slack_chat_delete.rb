require 'net/http'
require 'json'

# SLACK Documents
# https://api.slack.com/methods/channels.history
# https://api.slack.com/methods/chat.delete

SLACK_TOKEN = ENV['SLACK_API_TOKEN']
SLACK_LEGACY_TOKEN = ENV['SLACK_LEGACY_TOKEN']
CHANNEL_ID = ''
BOT_TITLE = ''
count = 1000

response = Net::HTTP.get_response(URI.parse("https://slack.com/api/channels.history?token=#{SLACK_TOKEN}&channel=#{CHANNEL_ID}&count=#{count}"))
res_json = JSON.parse(response.body)

res_json['messages'].each do |message|
  if message['files'].nil?
    puts 'files is nil'
  elsif message['files'][0]['title'].start_with?(BOT_TITLE)
    puts "DELETE Message form: #{message['files'][0]['from'][0]['name']} title:  #{message['files'][0]['title']}"
    response = Net::HTTP.post_form(URI.parse('https://slack.com/api/chat.delete'),
                                   token: SLACK_LEGACY_TOKEN,
                                   channel: CHANNEL_ID,
                                   ts: message['ts'],
                                   as_user: true
                              )
    puts JSON.pretty_generate(JSON.parse(response.body))
    sleep(0.65) # for Slack API Rate Limits 1-100+ requests per method per workspace per minute
  end
end
