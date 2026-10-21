#!/bin/bash

# Скрипт перенаправления потока и наложение текста

# При запуске выполним переустановку модуля, иногда с ним проблемы
sudo rmmod v4l2loopback # если модуль ещё не установлен, выдаст ошибку, это ОК
sudo modprobe v4l2loopback devices=1 buffers=8 video_nr=10 card_label="Virtual-Camera" exclusive_caps=1

# Один из вариантов запуска
# Берём поток с /dev/video0, периодически накидываем текст из data.txt и пишем в /dev/video10
# Можно подложить свой TTF вместо /usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf
ffmpeg -f v4l2 -input_format mjpeg -video_size 1280x720 -framerate 30 -fflags nobuffer -flags low_delay -thread_queue_size 1024 -i /dev/video0 \
-vf "format=yuv420p,drawtext=fontfile=/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf:textfile=data.txt:reload=1:x=(w-tw)/2:y=(h-th)/2:fontsize=140:fontcolor=white:borderw=5:bordercolor=black" \
-c:v mjpeg -threads 4 -q:v 4 -fflags nobuffer -f v4l2 /dev/video10

