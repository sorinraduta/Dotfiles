#!/bin/sh

case "$1" in
    --clean)
        rm -rf ~/.local/share/Trash/files
        rm -rf ~/.local/share/Trash/info
        mkdir ~/.local/share/Trash/files
        mkdir ~/.local/share/Trash/info
        ;;
    *)
        trash_files=$(find ~/.local/share/Trash/files/ -maxdepth 1 | wc -l)
        trash_files=$(("$trash_files" - "1"))

        if [ "$trash_files" -gt 0 ]; then
            echo "$trash_files"
        fi
        ;;
esac