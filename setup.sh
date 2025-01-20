#!/bin/bash

# Stop the script on any error
set -e

echo
echo
echo "| Setting up the project environment..."
echo "|"
echo "|--- Firefox is a required module for saving Holoviews-Bokeh Models to directory."
echo "|--- Preferred method for downloading Firefox module is through the Conda-Forge Channel."
echo "|--- If not permitted, setup will check for existing Firefox module, and exit if not located."
echo " --------------------------------------------------------------------------------------------"
echo
echo

# Step 1: Check for Conda
echo "Checking for Conda..."
echo
if command -v conda &> /dev/null; then
    echo "Conda is available. Would you like to use Conda to install Firefox? (y/n)"
    read -r use_conda
    if [ "$use_conda" == "y" ]; then
        echo
        echo "Using Conda to install Firefox..."
        conda install -y -c conda-forge firefox
        echo
        echo "#####################################"
        echo "#   Firefox installed with Conda.   #"
        echo "#####################################"
        echo
    fi
else
    echo "Conda is not installed. Continuing with manual checks for Firefox..."
    echo
fi
echo

# Step 2: Check if Firefox is installed
echo "Checking for Firefox..."
echo 
if ! command -v firefox &> /dev/null; then
    echo "Firefox is not installed. Please install it before continuing."
    echo "You can download Firefox from: https://www.mozilla.org/firefox/"
    echo "      or re-run setup.sh and allow Conda-Forge to load Firefox."
    echo
    echo "ERROR --> EXITING SETUP.SH"
    exit 1
else
    echo "Firefox is already installed!"
fi
echo

# Step 3: Create a virtual environment if it doesn't already exist
if [ ! -d "venv" ]; then
    echo "Creating a virtual environment..."
    python -m venv venv
else
    echo "Virtual environment already exists!"
fi
echo

# Step 4: Activate the virtual environment
echo "Activating the virtual environment..."
source venv/bin/activate
echo

# Step 5: Upgrade pip and install Python dependencies
echo "Upgrading pip and installing dependencies from requirements.txt..."
echo
pip install --upgrade pip
pip install -r requirements.txt
echo
echo "###################################################################"
echo "#   requirements.txt has been read and all dependencies loaded!   #"
echo "###################################################################"
echo

# Step 6: Check for Geckodriver
echo "Checking for Geckodriver..."
echo
if ! command -v geckodriver &> /dev/null; then
    echo "Geckodriver not found globally. Installing locally..."
    echo
    # Determine the OS
    OS=$(uname -s)
    case "$OS" in
        Linux*)
            GECKO_DRIVER="./bin/geckodriver-v0.35.0-linux64"
            ;;
        Darwin*)
            GECKO_DRIVER="./bin/geckodriver-v0.35.0-macos"
            ;;
        CYGWIN*|MINGW*|MSYS*)
            GECKO_DRIVER="./bin/geckodriver-v0.35.0-win64.exe"
            ;;
        *)
            echo
            echo "Unsupported operating system: $OS"
            echo "ERROR --> EXITING SETUP.SH"
            exit 1
            ;;
    esac

    if [ -f "$GECKO_DRIVER" ]; then
        echo "Geckodriver binary found locally at $GECKO_DRIVER."
        echo
        chmod +x "$GECKO_DRIVER"

        # Copy Geckodriver into the virtual environment's bin directory
        cp "$GECKO_DRIVER" venv/bin/geckodriver
        PATH="$(pwd)/venv/bin:$PATH"
        export PATH
        echo
        echo "#################################################################"
        echo "#   Geckodriver installed locally in the virtual environment.   #"
        echo "#################################################################"
    else
        echo "Geckodriver binary not found for your platform in ./bin."
        echo "ERROR --> EXITING SETUP.SH"
        exit 1
    fi
    echo
else
    echo "Geckodriver is already installed globally!"
    echo 
fi
deactivate

echo "################################################################################################"
echo "#    Setup Complete! Virtual Environment is ready to use in VS Code with Jupyter Notebooks!    #"
echo "#  The designated order the .ipynb Notebooks should be run in is havoc_ETL -> havoc_analysis   #"
echo "#  Before running each notebook, please select the newly created kernel: venv (python 3.12.2)  #"
echo "#                    You're ready to go! Thanks for using the setup script!                    #"
echo "################################################################################################"