#!/bin/bash

# Stop the script on any error
set -e

echo
echo
echo "| Setting up the project environment..."
echo "|"
echo "|--- Firefox and Geckodriver are required modules for saving Holoviews-Bokeh Models to directory."
echo "|--- Preferred method for downloading Firefox & Geckodriver modules is through the Conda-Forge Channel."
echo "|--- If not permitted, setup will check for existing modules, and exit if not located."
echo " --------------------------------------------------------------------------------------------"
echo
echo

# Step 1: Check for Conda to install Firefox and Geckodriver
echo "Checking for Conda..."
echo
if command -v conda &> /dev/null; then
    echo "Conda is available!"
    echo "Would you like to use Conda to install Firefox? (y/n)"
    read -r conda_for_firefox
    echo
    if [ "$conda_for_firefox" == "y" ]; then
        echo
        echo "Using Conda to install Firefox..."
        conda install -y -c conda-forge firefox
        echo
        echo "#####################################"
        echo "#   Firefox installed with Conda!   #"
        echo "#####################################"
        echo
    else
        echo "| Manual checks will be performed after Conda-Forge confirmations."
        echo
        echo
    fi
    echo "Would you like to use Conda to install Geckodriver? (y/n)"
    read -r conda_for_geckodriver
    echo
    if [ "$conda_for_geckodriver" == "y" ]; then
        echo
        echo "Using Conda to install Geckodriver..."
        conda install -y -c conda-forge geckodriver
        echo
        echo "#########################################"
        echo "#   Geckodriver installed with Conda!   #"
        echo "#########################################"
    else
        echo "| Manual checks will now start."
        echo
        echo
    fi
else
    echo "| Conda is not installed. Continuing with manual checks..."
    echo
    echo
fi
echo

# Step 2: Check if Firefox is installed
echo "Checking for Firefox..."
echo 
if ! command -v firefox &> /dev/null; then
    echo "Firefox is not installed. Please install it before continuing."
    echo "You can download Firefox from: https://www.mozilla.org/firefox/"
    echo "or (preferred:) re-run setup.sh and allow Conda-Forge to load Firefox."
    echo
    echo "# ERROR --> EXITING SETUP.SH"
    exit 1
else
    echo "| Firefox is already installed!"
fi
echo
echo

# Step 3: Check if Geckodriver is installed
if ! command -v geckodriver &> /dev/null; then
    echo "Geckodriver is not installed. Please install it before continuing."
    echo "You can download Geckodriver from: https://github.com/mozilla/geckodriver/releases"
    echo "or (preferred:) re-run setup.sh and allow for Conda-Forge to load Geckodriver."
    echo
    echo "# ERROR --> EXITING SETUP.SH"
    exit 1
else
    echo "| Geckodriver is already installed!"
fi
echo

# Step 4: Create a virtual environment if it doesn't already exist
if [ ! -d "venv" ]; then
    echo "Creating a virtual environment..."
    python -m venv venv
else
    echo "| Virtual environment already exists!"
fi
echo

# Step 5: Activate the virtual environment
echo "Activating the virtual environment..."
source venv/bin/activate
echo

# Step 6: Upgrade pip and install Python dependencies
echo "Upgrading pip and installing dependencies from requirements.txt..."
echo
pip install --upgrade pip
pip install -r requirements.txt
echo
echo "###################################################################"
echo "#   requirements.txt has been read and all dependencies loaded!   #"
echo "###################################################################"
echo

# Deactivate Venv after dependency loading
deactivate

echo "################################################################################################"
echo "#    Setup Complete! Virtual Environment is ready to use in VS Code with Jupyter Notebooks!    #"
echo "#  The designated order the .ipynb Notebooks should be run in is havoc_ETL -> havoc_analysis   #"
echo "#  Before running each notebook, please select the newly created kernel: venv (python 3.12.2)  #"
echo "#                    You're ready to go! Thanks for using the setup script!                    #"
echo "################################################################################################"