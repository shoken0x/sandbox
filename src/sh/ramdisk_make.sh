#!/bin/sh
# for Ramdisk

# 20480=10MB 204800=100MB
NUMSECTORS=2048000

#dive name
DEVNAME=ramdisk

# make ramdisk
MYDEV=`hdid -nomount ram://$NUMSECTORS`

# format as HFS+
diskutil eraseDisk HFS+ $DEVNAME `echo $MYDEV`

# for Safari
mkdir -p /Volumes/$DEVNAME/com.apple.Safari
rm -rf `echo $TMPDIR`com.apple.Safari
ln -s /Volumes/$DEVNAME/com.apple.Safari $TMPDIR

# for Chrome
mkdir -p /Volumes/$DEVNAME/ChromeCache/Default
rm -rf ~/Library/Caches/Google/Chrome/Default
ln -s /Volumes/$DEVNAME/ChromeCache/Default ~/Library/Caches/Google/Chrome/
