mkdir -p ~/bin 
[ -d "$HOME/.local/state/nvim" ] && rm -rf ~/.local/state/nvim
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
ln -s ~/bin/nvim.appimage ~/bin/nvim 
nvim --version
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
[ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
git clone https://github.com/NvChad/starter ~/.config/nvim 
sudo apt update
source ~/.bashrc 
cd ~
