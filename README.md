# Author: savindu pasintha
# Deployment Trigger Server

This repository contains a Flask-based server designed to trigger deployment actions via a POST request to the `/deploy` endpoint. The server is configured to integrate with GitHub Actions to automate deployment tasks whenever code changes are pushed to any branch.

## Repository Structure

- **`scripts/`**: Contains essential shell scripts for deployment and server setup.
  - **`deploy.sh`**: Executes the deployment tasks. You can write your own scripts run.
  - **`start.sh`**: Creates a virtual environment, installs dependencies, and starts the Flask server.

- **`app.py`**: The main Flask application file. It handles incoming POST requests to trigger the deployment script.

- **`requirements.txt`**: Lists Python dependencies required for the Flask application.

- **`.github/workflows/deploy.yml`**: GitHub Actions workflow configuration to automatically trigger the `/deploy` endpoint upon code changes.
 also you can give your server address endpoints to trigger this.

## Setup Instructions
Ensure that all necessary packages are installed on your system. Run the following command to install them:

```bash
git clone https://github.com/savindu-pasintha/deployment-trigger-server.git
cd deployment-trigger-server

chmod +x start.sh
chmod +x scripts/deploy.sh

./start.sh

