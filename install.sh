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

        OLD_DEST="$HOME/old_custom_scripts"
        echo "$SCRIPT_NAME: Moved already existing custom scripts dir to $OLD_DEST"
        mv "$DESTINATION" "$OLD_DEST"
    fi

    cp -r "$SCRIPTS_DIR" "$DESTINATION"
}

install_bashrc() {
    local BASHRC_PATH

    BASHRC_PATH="$FILE_DIR/.bashrc"

    if [[ -f "$HOME/.bashrc" ]]; then
        echo "$SCRIPT_NAME: Moved already existing bashrc file to $HOME/old_bashrc"
        mv "$HOME/.bashrc" "$HOME/old_bashrc"
    fi

    cp "$BASHRC_PATH" "$HOME"
}


install_bashrc || exit 1
install_custom_scripts || exit 1
