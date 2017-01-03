require 'curb'
require 'tempfile'
require 'openssl'
require 'json'

class InstagramPrivate

  def initialize(username, password, photo, caption)
    @username = username
    @password = password
    @photo = photo
    @caption = caption

    @cookiepath = Tempfile.new('cookies').path
    @user_agent = generate_user_agent()
    @guid = generate_guid()
    @device_id = generate_device_id(@guid)
  end

  def send
    login = login()

    if login['status'] == 'ok'
      media = upload()

      if media['status'] == 'ok'
        configure = configure(media['media_id'])

        return configure
      end

      return media
    end

    return login
  end

  def generate_user_agent
    resolution = ['720x1280', '320x480', '480x800', '1024x768', '1280x720', '768x1024', '480x320'].sample
    version = ['GT-N7000', 'SM-N9000', 'GT-I9220', 'GT-I9100'].sample
    dpi = ['120', '160', '320', '240'].sample

    return 'Instagram 4.' + rand(1..2).to_s + '.' + rand(0..2).to_s + ' Android (' + rand(10..11).to_s + '/' + rand(1..3).to_s + '.' + rand(3..5).to_s + '.' + rand(0..5).to_s + '; #{dpi}; #{resolution}; samsung; #{version }; #{version}; smdkc210; en_US)'
  end

  def generate_guid
    guid = sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
      rand(0..65535),
      rand(0..65535),
      rand(0..65535),
      rand(16384..20479),
      rand(32768..49151),
      rand(0..65535),
      rand(0..65535),
      rand(0..65535))

    return guid
  end

  def generate_device_id(guid)
    return 'android-#{guid}'
  end

  def generate_signature(data)
    return OpenSSL::HMAC.hexdigest('sha256', 'b4a23f5e39b5929e0666ac5de94c89d1618a2916', data)
  end

  def request(url, data, upload, cookies)
    http = Curl::Easy.new(url)

    http.headers["User-Agent"] = @user_agent
    http.multipart_form_post = upload
    http.verbose = true
    http.follow_location = true
    http.enable_cookies = true

    if cookies
      http.cookiefile = @cookiepath
    else
      http.cookiejar = @cookiepath
    end

    if data.kind_of?(Array)
      http.send('post', *data)
    else
      http.send('post', data)
    end

    response = JSON.parse(http.body)

    http.close

    return response
  end

  def login
    url = 'https://instagram.com/api/v1/accounts/login/'

    data = "{'username':'#{@username}','password':'#{@password}','guid':'#{@guid}','device_id':'#{@device_id}','Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}".gsub("'", '"')
    signature = generate_signature(data)
    body = 'ig_sig_key_version=4&signed_body=' + signature + '.' + URI::encode(data, /\W/)

    response = request(url, body, false, false)

    return response
  end

  def upload
    url = 'https://instagram.com/api/v1/media/upload/'

    device_timestamp = Time.now.to_i.to_s

    data = [
      Curl::PostField.file('photo', @photo),
      Curl::PostField.content('device_timestamp', device_timestamp)
    ]

    response = request(url, data, true, true)

    return response
  end

  def configure(media_id)
    url = 'https://instagram.com/api/v1/media/configure/'

    device_timestamp = Time.now.to_i.to_s
    data = "{'guid':'#{@guid}','device_id':'#{@device_id}','device_timestamp':'#{device_timestamp}','media_id':'#{media_id}','caption':'#{@caption}','source_type':'5','filter_type':'0','extra':'{}','Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'}".gsub("'", '"')
    signature = generate_signature(data)
    body = 'ig_sig_key_version=4&signed_body=' + signature + '.' + URI::encode(data, /\W/)

    response = request(url, body, false, true)

    return response
  end
end

puts "hello instagram!!"
instagram = InstagramPrivate.new('takakokida', 'voh0mieV', 'sf.jpg', 'fresh!')
puts instagram.send
