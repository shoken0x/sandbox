require 'webrick'
require 'json'

server = WEBrick::HTTPServer.new(Port: 8000, ServerType: WEBrick::Daemon)

server.mount_proc '/' do |req, res|
  req_json = JSON.parse(req.body)
  if req_json["ref"] == "refs/heads/master"
    system "cd /home/rails/foodface && git pull && bundle install && /home/rails/sh/rails_restart.sh"
  end
end

trap 'INT' do server.shutdown end
server.start
