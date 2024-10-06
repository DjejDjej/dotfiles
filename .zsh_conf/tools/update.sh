#!/bin/bash

# Define the base directory
BASE_DIR=~/dotfiles

# Function to perform git pull and update submodules
function git_pull() {
    if [ -d "$1" ]; then
        cd "$1" || return

        # Perform git pull
        output=$(git pull --rebase 2>&1)

        # Check if the pull resulted in changes and print the output
        if [[ "$output" != *"Already up to date"* ]]; then
            echo "Updated $1:"
            echo "$output"
            echo "Updating submodules..."
            git submodule update --init --recursive
            echo "Submodules updated for $1."
        fi
    fi
}

# Perform git pull for the main directory and subdirectories
git_pull "$BASE_DIR"
git_pull "$BASE_DIR/dwm"
git_pull "$BASE_DIR/.config/nvim"

