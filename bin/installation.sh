#!/bin/bash

USER_HOME=$(eval echo ~$SUDO_USER)
BIN_DIR="$USER_HOME/bin"
CONFIG_DIR="$USER_HOME/.config"
STATE_DIR="$USER_HOME/.local/state"
CONFIG_FILE="../cfg/config.ini"
SERVICE=$(crudini "$CONFIG_FILE" cfg service)
DATA_DIR="../${SERVICE}-data"

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

wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
ln -sf "$BIN_DIR/nvim-linux-x86_64.appimage" "$BIN_DIR/nvim"

chown -R "$SUDO_USER:$SUDO_USER" "$BIN_DIR"

"$BIN_DIR/nvim" --version

cd "$USER_HOME" || exit 1

git clone https://github.com/NvChad/starter "$CONFIG_DIR/nvim"

sudo rm -rf "$CONFIG_DIR/nvim/.git" "$CONFIG_DIR/nvim/.github"

chown -R "$SUDO_USER:$SUDO_USER" "$CONFIG_DIR/nvim"

source "$USER_HOME/.bashrc"
