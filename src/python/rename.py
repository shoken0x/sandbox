import os

count = 0
for file in os.listdir('data/JPEGImages'):
    number_padded = '{0:05d}'.format(count)
    os.system("mv data/JPEGImages/" + file + " data/JPEGImages/img_" + number_padded + ".png")
    count = count + 1
