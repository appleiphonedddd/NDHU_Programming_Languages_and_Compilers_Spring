#!/bin/bash

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Update package index and install texlive and texlive-latex-extra
echo "Updating package index..."
apt-get update
echo "Installing LaTeX..."
apt-get install -y texlive texlive-latex-extra

# Check if LaTeX installation was successful
if [ $? -eq 0 ]; then
    echo "LaTeX has been successfully installed."
else
    echo "Failed to install LaTeX. Please check your internet connection and try again."
    exit 1
fi

# Optionally, you can add additional LaTeX packages or compilers here
# For example:
# apt-get install -y texlive-lang-<language_code>

exit 0
