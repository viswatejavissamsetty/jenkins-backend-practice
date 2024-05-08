#!/bin/bash

REPO_URL="https://github.com/example/repo.git"
LOCAL_DIR="."

while true; do
    # Fetch changes from the remote repository
    git -C "$LOCAL_DIR" fetch

    # Check if there are any changes
    if git -C "$LOCAL_DIR" diff --quiet HEAD FETCH_HEAD; then
        echo "No changes found. Sleeping for 10 seconds..."
        sleep 10
        continue
    fi

    # Pull the latest code
    git -C "$LOCAL_DIR" pull

    # Run npm build and install commands
    cd "$LOCAL_DIR"
    pnpm install
    pnpm run build


    pm2 stop test-app || true
    pm2 delete test-app || true
    pm2 start ecosystem.config.js npm --name "test-app" -- start


    echo "Operations completed. Sleeping for 10 seconds..."
    sleep 10
done
