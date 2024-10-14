#!/bin/bash

# Ensure the script is run with two arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <commit_id> <branch>"
    exit 1
fi

COMMIT_ID=$1
BRANCH=$2

# Perform deployment tasks
echo "Deploying commit $COMMIT_ID from branch $BRANCH"
# Add your deployment commands here

# Navigate to the assessment folder
cd ../assessment || { echo "Directory not found"; exit 1; }

echo $(pwd)
echo "Navigate to ../assessment"

# Stop all PM2 processes
pm2 stop all
if [ $? -ne 0 ]; then
    echo "Failed to stop PM2 processes."
    exit 1
fi

# Pull the latest changes from the main branch
git pull origin $BRANCH
if [ $? -ne 0 ]; then
    echo "Failed to pull from origin/main. Please check the repository."
    exit 1
fi

# Start all PM2 processes
pm2 start all
if [ $? -ne 0 ]; then
    echo "Failed to start PM2 processes."
    exit 1
fi

# Success message
echo "Successfully auto-deployed the changes. Branch: $BRANCH CommiteID: $COMMIT_ID "


# Example deployment commands
# git fetch origin $BRANCH
# git checkout $COMMIT_ID
# ./deploy_application.sh

# End of deployment script
