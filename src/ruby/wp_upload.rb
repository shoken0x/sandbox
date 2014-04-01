require 'xmlrpc/client'
@dbox_dir = '/tmp/fromMac/*'
@host = 'example.com'
@rpcPath = '/xmlrpc.php'
@user = ''
@pass = ''

@filelist = []

server = XMLRPC::Client.new(@host, @rpcPath)
id = '1' #ライブラリに入れたい記事のPostId


Dir.glob(@dbox_dir) do |f|
  if /.*?\.(jpe?g|JPE?G|png|PNG)$/ =~ f
    @filelist << f
  end
end

@filelist.each do |file|
  fileName = File.basename(file)
  fileExt = File.extname(file)

  type = 'image/jpeg'
  if fileExt.include?("png") || fileExt.include?("PNG")
    type = 'image/png'
  elsif fileExt.include?("jpg") ||
          fileExt.include?("jpeg") ||
          fileExt.include?("JPG") ||
          fileExt.include?("JPEG")
    type = 'image/jpeg'
  else
    break
  end


  open(fileName, 'wb') do |f|
    open(file) do |data|
      f.write(data.read)
    end
  end

  base64 = XMLRPC::Base64.new(File.read(fileName))
  fileHash = {
    name: fileName,
    type: type,
    bits: base64
  }
  server.call("metaWeblog.newMediaObject",id,@user,@pass,fileHash )
end
