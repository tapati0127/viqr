#!/bin/bash

# URL to download JDK
URL="https://download.oracle.com/java/23/archive/jdk-23.0.2_linux-x64_bin.deb"
FILE="jdk-23.0.2_linux-x64_bin.deb"

# Check if the file already exists
if [ -f "$FILE" ]; then
    echo "File $FILE already exists, skipping download."
else
    echo "Downloading $FILE..."
    wget "$URL" -O "$FILE"
fi

# Install the .deb package
echo "Installing JDK..."
sudo dpkg -i "$FILE"

# Fix missing dependencies if any
sudo apt-get install -f -y
