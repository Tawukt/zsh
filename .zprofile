#!/usr/bin/env bash
# add `export ZDOTDIR="$HOME/.config/zsh"` to /etc/zsh/zshenv in order to place this file at .config/zsh/.zprofile

# ssh
#ssh-add ~/.ssh/github

# miniconda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY='1'

# default programs
export EDITOR="nvim"
export TERM="kitty"
export TERMINAL="kitty"
#export MUSPLAYER="termusic"
export BROWSER="brave"
export VISUAL="nvim"

#Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# follow XDG base dir specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# moving other files and some other vars
export DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"
export WINEPREFIX="$XDG_DATA_HOME/wineprefixes/default"
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
export STARSHIP_CACHE="$XDG_CACHE_HOME/starship/cache"

# PATH
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

export MANPAGER='nvim +Man'

export WORD="$HOME/Documents/cyber/ressource/wordlist"
