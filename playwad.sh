#!/bin/bash

# Function to install chocolate-doom
install_chocolate_doom() {
    if command -v apt-get &> /dev/null; then
        sudo apt-get update
        sudo apt-get install chocolate-doom -y
    elif command -v dnf &> /dev/null; then
        sudo dnf install chocolate-doom -y
    elif command -v pacman &> /dev/null; then
        sudo pacman -S chocolate-doom --noconfirm
    elif command -v zypper &> /dev/null; then
        sudo zypper install chocolate-doom -y
    elif command -v yum &> /dev/null; then
        sudo yum install chocolate-doom -y
    elif command -v apk &> /dev/null; then
        sudo apk add chocolate-doom
    else
        echo "Unsupported package manager. Please install chocolate-doom manually."
        exit 1
    fi

    # Check if installation was successful
    if ! command -v chocolate-doom &> /dev/null; then
        echo "Failed to install chocolate-doom. Please install it manually and rerun the script."
        exit 1
    fi
}

# Check if chocolate-doom is installed
if ! command -v chocolate-doom &> /dev/null; then
    echo "chocolate-doom is not installed."
    read -p "Would you like to install it? [y/n]: " install_choice

    if [[ $install_choice == "y" || $install_choice == "Y" ]]; then
        install_chocolate_doom
    else
        echo "Please install chocolate-doom and rerun the script."
        exit 1
    fi
fi

# Change to the directory containing the script
SCRIPT_DIR="$(dirname "$0")"

# Check if the wads directory exists
if [ -d "$SCRIPT_DIR/wads" ]; then
    # Change to the wads directory
    cd "$SCRIPT_DIR/wads" || { echo "Failed to change directory"; exit 1; }

    # Prompt the user to select a WAD file
    echo "Select the WAD file to run:"
    echo "1) Freedom Scoops First Crunch (fsfc1.wad)"
    echo "2) Freedom Scoops Second Crunch (fssc1.wad)"
    echo "[CTRL+C] to exit"
    read -p "Enter choice [1-2]: " choice

    case $choice in
        1)
            WAD_FILE="fsfc1.wad"
            ;;
        2)
            WAD_FILE="fssc1.wad"
            ;; 
        *)
            echo "Invalid choice"
            exit 1
            ;;
    esac

    # Run chocolate-doom with the selected WAD file
    chocolate-doom -iwad "$WAD_FILE"

else
    echo "The 'wads' directory does not exist."
    echo "Please run 'make' in the terminal to create the necessary directory and files."
    exit 1
fi