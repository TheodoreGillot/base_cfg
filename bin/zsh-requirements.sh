#!/bin/zsh

# Check if Homebrew is already installed
if ! command -v brew &> /dev/null; then
  echo "Homebrew not found. Installing..."

  # Install Homebrew using curl
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Add Homebrew to PATH
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"

  echo "Homebrew installed successfully."
else
  echo "Homebrew already installed."
fi

# Update Homebrew
brew update

# Install requirements using Homebrew
brew install crudini
brew install npm
brew install git
brew install wget
brew install curl
brew install emacs
brew install bsdmainutils
brew install htop
brew install vim
brew install tree
brew install qpdfview
brew install net-tools
brew install apt-file
brew install procps
brew install iputils
brew install lbzip2
brew install pigz
brew install xz
brew install pbzip2
brew install unrar
brew install unzip
brew install p7zip
brew install rsync
brew install python
brew install python3-venv

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc