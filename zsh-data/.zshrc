# ZSH Configuration

# History configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt HIST_IGNORE_ALL_DUPS  # Don't record duplicates in history
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY    # Add commands to history as they are typed
setopt EXTENDED_HISTORY      # Add timestamps to history

# Terminal colors
autoload -U colors && colors

# Set up prompt
autoload -Uz promptinit
promptinit

# Basic prompt with username, hostname, and current directory
PS1="%{$fg[green]%}%n@%m%{$reset_color%}:%{$fg[blue]%}%~%{$reset_color%}$ "

# Set terminal title
case $TERM in
    xterm*|rxvt*)
        precmd () { print -Pn "\e]0;%n@%m: %~\a" }
        ;;
esac

# Enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Load completion system
autoload -Uz compinit
compinit

# Load aliases if they exist
if [ -f ~/.aliases.sh ]; then
    . ~/.aliases.sh
fi

# Enable menu-style completion
zstyle ':completion:*' menu select

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colored completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Better directory navigation
setopt AUTO_CD              # If command is a directory path, cd to it
setopt AUTO_PUSHD          # Push directories onto directory stack
setopt PUSHD_IGNORE_DUPS   # Don't push duplicates onto directory stack
