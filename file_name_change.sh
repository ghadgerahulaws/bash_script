#!/bin/bash
SOURCE_DIR="/root/checkpoint"
TARGET_DIR="/root/tmp"
DATE=$(date +"%Y%m%d")
TAR_FILE=report_${DATE}.tar.gz
mkdir -p "$TARGET_DIR"
for file in "$SOURCE_DIR"/*;do
    if [[ -f $file ]];then
        BASENAME=$(basename "$file")
        EXT="${BASENAME##*.}"
        FILENAME="${BASENAME%.*}"
        NEW_FILENAME="${FILENAME}_${DATE}.${EXT}"
        NEW_FILEPATH="$TARGET_DIR/$NEW_FILENAME"

    if [[ ! -e "$NEW_FILEPATH" ]]; then
        cp -pr "$file" "$NEW_FILEPATH"
        else 
        echo "already exist"
        fi
    fi
done

tar -czf $TAR_FILE" -C "$TARGET_DIR"
