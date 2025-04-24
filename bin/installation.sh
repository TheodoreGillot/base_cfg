#!/bin/bash

USER_HOME=$(eval echo ~$SUDO_USER)
BIN_DIR="$USER_HOME/bin"
CONFIG_DIR="$USER_HOME/.config"
STATE_DIR="$USER_HOME/.local/state"
CONFIG_FILE="../cfg/config.ini"
DATA_DIR="../${SERVICE}-data"
OS="$(crudini "$CONFIG_FILE" cfg service)"

arch=$(uname -m)
osname=$(uname -s)

if [[ "$osname" == "Darwin" ]]; then
    if [[ "$arch" == "x86_64" ]]; then
        OS="mac-x86_64"
    elif [[ "$arch" == "arm64" ]]; then
        OS="mac-arm64"
    else
        echo "Unsupported Mac architecture: $arch" >&2
        exit 1
    fi
elif [[ "$osname" == "Linux" ]]; then
    if [[ "$arch" == "x86_64" ]]; then
        OS="linux-x86_64"
    else
        echo "Unsupported Linux architecture: $arch" >&2
        exit 1
    fi
else
    echo "Unsupported OS: $osname" >&2
    exit 1
fi

echo "Detected platform: $OS"

cp "$DATA_DIR/.aliases.sh" "$USER_HOME"
cp "$DATA_DIR/.bashrc" "$USER_HOME"
cp "$DATA_DIR/.profile" "$USER_HOME"
cp "$DATA_DIR/.gitconfig" "$USER_HOME"

EMAIL=$(crudini "$CONFIG_FILE" cfg mail)
NAME=$(crudini "$CONFIG_FILE" cfg username)

git config --global user.email "$EMAIL"
git config --global user.name "$NAME"

rm -rf "$STATE_DIR/nvim" "$CONFIG_DIR/nvim" "$BIN_DIR/nvim-linux-x86_64.appimage" "$BIN_DIR/nvim"

mkdir -p "$CONFIG_DIR" "$BIN_DIR"

cd "$BIN_DIR" || exit 1

if ["$OS" = "linux-x86_64"]; then 
  wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage # ubuntu x86 
  chmod u+x nvim-linux-x86_64.appimage
  ls -sf "$BIN_DIR/nvim-linux-x86_64.appimage" "$BIN_DIR/nvim"
fi

if ["$OS" = "mac-arm64"]; then 
  https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-macos-arm64.tar.gz # mac arm
  un nvim-macos-arm64.tar.gz 
  chmod u+x nvim-macos-arm64
  ln -sf "$BIN_DIR/nvim-macos-arm64" "$BIN_DIR/nvim"
fi

if ["$OS" = "mac-x86_64"]; then
  https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-macos-x86_64.tar.gz # mac x86 
  un nvim-macos-x86_64.tar.gz
  chmod u+x nvim-macos-x86_64
  ln -sf "$BIN_DIR/nvim-macos-x86_64" "$BIN_DIR/nvim"
fi

chown -R "$SUDO_USER:$SUDO_USER" "$BIN_DIR"

"$BIN_DIR/nvim" --version || exit 1

cd "$USER_HOME" || exit 1

git clone https://github.com/NvChad/starter "$CONFIG_DIR/nvim"

sudo rm -rf "$CONFIG_DIR/nvim/.git" "$CONFIG_DIR/nvim/.github"

chown -R "$SUDO_USER:$SUDO_USER" "$CONFIG_DIR/nvim"

source "$USER_HOME/.bashrc"
