#!/bin/bash

set -e

# Exit immediately if a command exits with a non-zero status
echo "Setting up the environment for HavocMapper on macOS..."

# Step 1: Create a virtual environment if it doesn't already exist
# Using "." convention to naturally hide environment from GUIs
if [ ! -d ".venv" ]; then
    echo "Creating a virtual environment..."
    python3 -m venv .venv
else
    echo "Virtual environment already exists."
fi

# Step 2: Activate the virtual environment
echo "Activating the virtual environment..."
source .venv/bin/activate

# Step 3: Upgrade pip and install Python dependencies
echo "Upgrading pip and installing dependencies from requirements.txt..."
pip install --upgrade pip
pip install -r requirements.txt

# Step 4: Set up Geckodriver
echo "Setting up Geckodriver..."
BIN_DIR="./bin"
GECKO_DRIVER="$BIN_DIR/geckodriver-mac"

if [ -f "$GECKO_DRIVER" ]; then
    chmod +x "$GECKO_DRIVER"
    # Attempt to create a symlink in /usr/local/bin (requires sudo for global use)
    if ln -sf "$(pwd)/$GECKO_DRIVER" /usr/local/bin/geckodriver 2>/dev/null; then
        echo "Geckodriver has been successfully installed and linked to /usr/local/bin."
    else
        echo "Unable to create a symlink in /usr/local/bin. You can add $(pwd)/$GECKO_DRIVER to your PATH manually."
    fi
else
    echo "Error: Geckodriver binary not found in $BIN_DIR. Please ensure it exists."
    exit 1
fi

echo "Setup complete. To start working, activate the virtual environment using: source .venv/bin/activate"