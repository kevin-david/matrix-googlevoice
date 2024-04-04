#!/bin/bash

# Check if forever is installed
if ! command -v forever &> /dev/null
then
    echo "Forever package is not installed. Installing now..."
    sudo npm install -g forever
else
    echo "Forever package is already installed."
fi

# Check if a forever process is already running with matrix-googlevoice-bot.js
if forever list | grep -q "matrix-googlevoice-bot.js"
then
    echo "A forever process is already running with matrix-googlevoice-bot.js"
else
    echo "No forever process is running with matrix-googlevoice-bot.js. Starting a new process with 5 max retries..."
    forever -m5 start matrix-googlevoice-bot.js
fi
