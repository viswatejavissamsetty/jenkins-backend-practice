#!/bin/bash

REPO_URL="https://github.com/example/repo.git"
LOCAL_DIR="."

while true; do
    # Fetch changes from the remote repository
    git -C "$LOCAL_DIR" fetch

    # Check if there are any changes
    if git -C "$LOCAL_DIR" diff --quiet HEAD FETCH_HEAD; then
        echo "No changes found. Sleeping for 1 minute..."
        sleep 60
        continue
    fi

    # Pull the latest code
    git -C "$LOCAL_DIR" pull

    # Run npm build and install commands
    cd "$LOCAL_DIR"
    npm run build
    npm install

    echo "Operations completed. Sleeping for 1 minute..."
    sleep 60
done
