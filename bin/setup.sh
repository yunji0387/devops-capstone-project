#!/bin/bash
echo "****************************************"
echo " Setting up Capstone Environment"
echo "****************************************"

# echo "Installing Python 3.9 and Virtual Environment"
# sudo apt-get update
# sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python3.9 python3.9-venv

echo "Checking the Python version..."
python3.9 --version

echo "Creating a Python virtual environment"
python3.9 -m venv ~/venv

# echo "Configuring the developer environment..."
# echo "# DevOps Capstone Project additions" >> ~/.bashrc
# echo "export GITHUB_ACCOUNT=$GITHUB_ACCOUNT" >> ~/.bashrc
# echo 'export PS1="\[\e]0;\u:\W\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ "' >> ~/.bashrc
# echo "source ~/venv/bin/activate" >> ~/.bashrc

echo "Installing Python dependencies..."
source ./venv/Scripts/activate && python3.9 -m pip install --upgrade pip wheel
source ./venv/Scripts/activate && pip install -r requirements.txt

echo "Starting the Postgres Docker container..."
/c/msys64/usr/bin/make db

echo "Checking the Postgres Docker container..."
docker ps

echo "****************************************"
echo " Capstone Environment Setup Complete"
echo "****************************************"
echo ""
echo "Use 'exit' to close this terminal and open a new one to initialize the environment"
echo ""
