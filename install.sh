#!/bin/bash


SCRIPT_NAME="$(basename $0)"
FILE_DIR="$(dirname $0)"


if [[ -z "$FILE_DIR" ]]; then
    echo "$SCRIPT_NAME: Failed to retrieve current path" >&2
    exit 1
fi


install_custom_scripts() {
    local SCRIPTS_DIR

    SCRIPTS_DIR="$FILE_DIR/.custom_scripts"
    DESTINATION="$HOME/.custom_scripts"

    if [[ -d "$DESTINATION" ]]; then
        local OLD_DEST

        OLD_DEST="$HOME/.custom_scripts_old"
        echo "$SCRIPT_NAME: Moved already existing custom scripts dir to $OLD_DEST"
        mv "$DESTINATION" "$OLD_DEST"
    fi

    cp -r "$SCRIPTS_DIR" "$DESTINATION"
}

install_file() {
    local LOCAL_FILE_PATH

    if [[ $# -lt 1 ]]; then
        echo "$SCRIPT_NAME: Programmer error: install_file requires at least one arg"
        exit 1
    fi

    LOCAL_FILE_PATH="$FILE_DIR/$1"
    DEST_FILE_PATH="$HOME/$1"

    if [[ -f "$DEST_FILE_PATH" ]]; then
        local OLD_FILE_PATH

        OLD_FILE_PATH="${DEST_FILE_PATH}_old"
        echo "$SCRIPT_NAME: Moved already existing $1 file to $OLD_FILE_PATH"
        mv "$DEST_FILE_PATH" "$OLD_FILE_PATH"
    fi

    cp "$LOCAL_FILE_PATH" "$DEST_FILE_PATH"
}


install_file ".bashrc" || exit 1
install_custom_scripts || exit 1
install_file ".bash_aliases" || exit 1
install_file ".bash_bookmarks" || exit 1
