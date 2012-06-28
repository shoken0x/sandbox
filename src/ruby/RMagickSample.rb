require 'rubygems'
require 'RMagick'
include Magick

images = ImageList.new("sf.jpg")
#images.alpha = ActivateAlphaChannel

dr = Draw.new
dr.fill = "#00000050"
dr.roundrectangle(40,50, 160,80, 10,10)
dr.polygon(*[100,81, 100,91, 110,81])
dr.draw(images);
# フォント
dr.font = "Tahoma"
# ポイントサイズ
dr.pointsize = 15
# 描画色
dr.fill = "#ffffffd0"
# gravity
dr.gravity = CenterGravity
dr.annotate(images, 0, 0, 55, 55, "San Francisco"){
    self.gravity = NorthWestGravity
}
images.write("sample915a.png")

exit
