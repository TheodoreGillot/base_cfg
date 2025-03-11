mkdir -p ~/bin 
cd ~/bin 
wget https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
ln -s ~/bin/nvim.appimage ~/bin/nvim 
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc 
source ~/.bashrc 
nvim --version
cd ~/base_cfg 
mv ./.bashrc ..
mv ./.aliases.sh ..
mv ./.profile ..
[ ! -d "$HOME/.config" ] && mkdir -p "$HOME/.config"
[ -d "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
git clone https://github.com/NvChad/starter ~/.config/nvim 
sudo apt update
sudo apt install gh -y
