#!/bin/bash

# Define variables
PROJECT_DIR=$(pwd)            # Current directory where the script is run
ENV_DIR="$PROJECT_DIR/venv"   # Virtual environment directory
APP_DIR="$PROJECT_DIR"        # Application directory (root of the project)
FLASK_APP="run.py"            # Flask entry point file

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
    pip install -r $PROJECT_DIR/requirements.txt
else
    echo "requirements.txt not found. Skipping dependency installation."
fi

# Start the Flask server
echo "Starting Flask server..."
python $APP_DIR/$FLASK_APP
