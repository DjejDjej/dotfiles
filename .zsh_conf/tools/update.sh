#!/bin/bash

# Define the base directory
BASE_DIR=~/dotfiles

# Function to perform git pull and update submodules
function git_pull() {
    if [ -d "$1" ]; then
        cd "$1"

        # Check if in a detached HEAD state
        if [ "$(git rev-parse --abbrev-ref HEAD)" = "HEAD" ]; then
            output=$(git pull origin master 2>&1)
        else
            output=$(git pull 2>&1)
        fi
        
        # Check if the pull resulted in changes
        if echo "$output" | grep -q 'Already up to date'; then
            return  # Do nothing if already up to date
        fi

        # Print only if there were changes
        if [[ $? -eq 0 ]]; then
            echo "Successfully pulled from $1."
            echo "Updating submodules for $1..."
            submodule_output=$(git submodule update --init --recursive 2>&1)
            if echo "$submodule_output" | grep -q 'Already up to date'; then
                return  # Do nothing if submodules are already up to date
            fi
            if [ $? -eq 0 ]; then
                echo "Successfully updated submodules for $1."
            fi
        fi
    fi
}

# Perform git pull for the main directory and subdirectories
git_pull "$BASE_DIR"
git_pull "$BASE_DIR/dwm"
git_pull "$BASE_DIR/.config/nvim"

