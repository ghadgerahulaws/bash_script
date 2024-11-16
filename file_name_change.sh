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
if [[ -f "$TAR_FILE" ]]; then
    echo "Please find the attached tar file." | mail -s "Tar File Report - $DATE" -a "$TAR_FILE" "$EMAIL"
    if [[ $? -eq 0 ]]; then
        echo "Email sent to $EMAIL with the tar file: $TAR_FILE"
    else
        echo "Failed to send email. Please check your mail configuration."
    fi
else
    echo "Tar file not found. Email not sent."
fi

# Exit the script
exit 0
