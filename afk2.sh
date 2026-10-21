#!/bin/bash

# Скрипт автоматического обновления AFK MM:SS в файле data.txt

TOTAL_SECONDS=120 # Время обратного отсчета в секундах

TEXT_FILE="data.txt"

cleanup() {
    echo -n " " > "$TEXT_FILE"
    exit 1
}

trap cleanup SIGINT

while [ $TOTAL_SECONDS -ge 0 ]; do
    if [ $TOTAL_SECONDS -eq 0 ]; then
        echo -n " " > "$TEXT_FILE"
        exit
    else
        MINUTES=$((TOTAL_SECONDS / 60))
        SECONDS=$((TOTAL_SECONDS % 60))
        STATUS_TEXT=$(printf " AFK \n%02d:%02d" $MINUTES $SECONDS)
        echo -n "$STATUS_TEXT" > "$TEXT_FILE"
        ((TOTAL_SECONDS--))
        sleep 1
    fi
done



