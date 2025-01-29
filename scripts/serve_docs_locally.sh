#!/bin/bash

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "Python 3 is required but not installed."
    exit 1
fi

# Navigate to the built-docs/ directory and start a simple HTTP server
cd local-docs && python3 -m http.server 8000