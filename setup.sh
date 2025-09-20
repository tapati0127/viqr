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
dpkg -i "$FILE"

# Fix missing dependencies if any
apt-get install -f -y

echo "Installing requirements..."
pip install -r requirements.txt


# URL to download STATIC
URL="https://trientp-public.s3.ap-northeast-1.amazonaws.com/new_static.zip"
FILE="new_static.zip"

# Check if the file already exists
if [ -f "$FILE" ]; then
    echo "File $FILE already exists, skipping download."
else
    echo "Downloading $FILE..."
    wget "$URL" -O "$FILE"
fi

# Unzip if not already extracted
DIR="new_static"
if [ -d "$DIR" ]; then
    echo "Directory $DIR already exists, skipping extraction."
else
    echo "Extracting $FILE..."
    unzip "$FILE" -d "$DIR"
fi