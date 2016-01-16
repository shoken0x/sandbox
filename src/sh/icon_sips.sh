sips -s format png -z 16 16 --out icons/icon_16x16.png ./t.jpg 
sips -s format png -z 32 32 --out icons/icon_16x16@2x.png ./t.jpg 
sips -s format png -z 32 32 --out icons/icon_32x32.png ./t.jpg 
sips -s format png -z 64 64 --out icons/icon_32x32@2x.png ./t.jpg 
sips -s format png -z 128 128 --out icons/icon_128x128.png ./t.jpg 
sips -s format png -z 256 256 --out icons/icon_128x128@2x.png ./t.jpg 
sips -s format png -z 256 256 --out icons/icon_256x256.png ./t.jpg
sips -s format png -z 512 512 --out icons/icon_256x256@2x.png ./t.jpg  
sips -s format png -z 512 512 --out icons/icon_512x512.png ./t.jpg 
sips -s format png -z 1024 1024 --out icons/icon_512x512@2x.png ./t.jpg 

sips -z 16 16 --out icons/icon_16x16.png ./t.png
sips -z 32 32 --out icons/icon_16x16@2x.png ./t.png
sips -z 32 32 --out icons/icon_32x32.png ./t.png
sips -z 64 64 --out icons/icon_32x32@2x.png ./t.png
sips -z 128 128 --out icons/icon_128x128.png ./t.png
sips -z 256 256 --out icons/icon_128x128@2x.png ./t.png
sips -z 256 256 --out icons/icon_256x256.png ./t.png
sips -z 512 512 --out icons/icon_256x256@2x.png ./t.png 
sips -z 512 512 --out icons/icon_512x512.png ./t.png
sips -z 1024 1024 --out icons/icon_512x512@2x.png ./t.png

iconutil -c icns khredmine.iconset/