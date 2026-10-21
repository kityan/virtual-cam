#!/bin/bash

# Запуск в tmux, чтобы справа работал ffmpeg, а слева был терминал для вывода текста в data.txt или запуска afk2
tmux new-session \; \
  split-window -h \; \
  send-keys './ffmpeg.sh' C-m \; \
  
