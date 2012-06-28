#!/bin/sh
# for Ramdisk

# 20480=10MB 204800=100MB
NUMSECTORS=1024000

#dive name
DEVNAME=ramdisk

# make ramdisk
MYDEV=`hdid -nomount ram://$NUMSECTORS`

# format as HFS+
diskutil eraseDisk HFS+ $DEVNAME $MYDEV

# for Safari
mkdir /Volumes/$DEVNAME/com.apple.Safari
#rm -f ~/Library/Caches/com.apple.Safari/Cache.db
#ln -s /Volumes/$DEVNAME/com.apple.Safari ~/Library/Caches/com.apple.Safari

# for Chrome
mkdir -p /Volumes/$DEVNAME/ChromeCache/Default
#rm -rf ~/Library/Caches/Google/Chrome/Default
#ln -s /Volumes/$DEVNAME/ChromeCache/Default ~/Library/Caches/Google/Chrome/Default
