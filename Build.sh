#!/bin/bash

# Check if the user is root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Update package index
echo "Updating package index..."
apt-get update

# Install bison and flex
echo "Installing bison and flex..."
apt-get install -y bison flex
if [ $? -eq 0 ]; then
    echo "Bison and flex have been successfully installed."
else
    echo "Failed to install bison and flex. Please check your internet connection and try again."
    exit 1
fi

# Install LaTeX packages
echo "Installing LaTeX (texlive and texlive-latex-extra)..."
apt-get install -y texlive texlive-latex-extra
if [ $? -eq 0 ]; then
    echo "LaTeX has been successfully installed."
else
    echo "Failed to install LaTeX. Please check your internet connection and try again."
    exit 1
fi

# Verify installations
echo "Verifying installations..."
echo "Bison version:"
bison --version

echo "Flex version:"
flex --version

echo "LaTeX version:"
pdflatex --version

exit 0
