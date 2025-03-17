# A simple ubuntu workflow config

## Information

This is my personnal config repository, made for linux ubuntu. Can be pretty usefull if you use terminal a lot in your workflow.
Feel free to use it !

### Content 

With this installation you will find : 

- .bashrc config with usefull aliases
- neovim installation and preconfiguration through [NvChad](https://nvchad.com/)
- personnal git config with personnal modification 

### Requirements

- Ubuntu 22.04 LTS and above (only 22.04 and 24.04 were tested)
- Sudoer leve lpermission is highly recommended

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

## Usefull new aliases 

This is a few basic aliases I use a lot, must have in mind if you are new to ubuntu to optimise your daily usage !

- General use aliases :

```bash
.. # cd .. ("..." also works for cd ../.. until .....)
l # ls -lAh
d # wget -c 
t # tree -Ca -I ".git*" --noreport
un # decrompresses pretty much all compressing protocols
cz # compresses under .tar.gz format
mkc # mkdir -p $1 && cd $1 
```

- Git centered aliases :

```bash
ga # git add -A 
gs # git status
gd # git diff 
gll # git log --graph --oneline --decorate --all --remotes=origin
gc # git checkout
gp # git pull 
gm # git commit -m "$"
```

See all aliases with $ ealias !
