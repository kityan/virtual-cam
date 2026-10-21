# Предварительная установка:

```sh
sudo apt install v4l2loopback-dkms v4l2loopback-utils ffmpeg tmux
```

# Запуск

```sh
./start.sh
```

В левой панели окна можно управлять текстом в `data.txt`, например: 

```sh
echo "TEST" > data.txt
```

или:

```sh
./afk2.sh
```

Использовать `tmux` не обязательно.
Но если использовать, то, чтобы выбирать панель мышью, нужно 
добавить в `~/.tmux.conf` строку: `set -g mouse on`

Проверить поток можно так, или сразу в браузере выбрать Virtual-Camera:

```sh
ffplay -f v4l2 -input_format mjpeg -fflags nobuffer -flags low_delay -framedrop /dev/video10
```

Имя настоящей камеры может быть другим в системе.