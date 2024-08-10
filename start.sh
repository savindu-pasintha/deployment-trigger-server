#!/bin/bash

# Define variables
PROJECT_DIR=$(pwd)            # Current directory where the script is run
ENV_DIR="$PROJECT_DIR/venv"   # Virtual environment directory
APP_DIR="$PROJECT_DIR"        # Application directory (root of the project)
FLASK_APP="app.py"            # Flask entry point file

# Update package lists and install python3-venv if not installed
if ! dpkg -l | grep -q python3-venv; then
    echo "python3-venv not found. Installing..."
    sudo apt update
    sudo apt install -y python3-venv
fi

# Check if virtual environment exists, create if not
if [ ! -d "$ENV_DIR" ]; then
    echo "Virtual environment not found. Creating..."
    python3 -m venv $ENV_DIR
fi

# Activate virtual environment
echo "Activating virtual environment..."
source $ENV_DIR/bin/activate

# Install dependencies
if [ -f "$PROJECT_DIR/requirements.txt" ]; then
    echo "Installing dependencies..."
    pip install --upgrade pip  # Upgrade pip to ensure latest version
    pip install -r $PROJECT_DIR/requirements.txt
else
    echo "requirements.txt not found. Skipping dependency installation."
fi

# Start the Flask server
echo "Starting Flask server..."
exec python $APP_DIR/$FLASK_APP
