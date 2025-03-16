# A simple ubuntu workflow config

## Information

This is my personnal config repository, made for linux ubuntu.
Feel free to use it !

### Content 

With this installation you will find : 

- .bashrc config with usefull aliases
- neovim installation and preconfiguration through [NvChad](https://nvchad.com/)
- personnal git config with personnal modification 

### Requirements

- Ubuntu 22.04 LTS and above (only 22.04 and 24.04 were tested)
- Sudoer level permission is highly recommended

## installation

I recommended to clone the repo in user's home directory : 

```bash
cd ~
git clone https://github.com/TheodoreGillot/base_cfg.git
```

First run base_cfg/bin/requirements.sh

```bash
cd base_cfg/bin
sudo bash requirements.sh
```

Then the installation process : 

```bash 
sudo bash installation.sh
```
