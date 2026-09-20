alias vim=nvim
alias l='eza -lahg --sort=name --icons=auto --group-directories-first'
alias ll='eza -ah --sort=name --icons=auto --group-directories-first'
alias ls='eza --sort=name --icons=auto --group-directories-first'
alias lt='eza --sort=name --icons=auto --group-directories-first --tree'

alias ..='cd ..'
alias ...='cd ../../'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias -- -='cd -'

alias p="pacman"
alias t="tmux"

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

alias lbo="libreoffice"

alias lsblk="lsblk | bat --style=plain -l conf"
alias ps="ps | bat --style=plain -l conf" 
alias lsusb="lsusb | bat --style=plain -l conf"
alias df="df -h | bat --style=plain -l conf"

alias diff="diff --color=auto"


[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"


# suffix aliases
alias -s py='$EDITOR'
alias -s md='bat'
alias -s c='$EDITOR'
alias -s cpp='$EDITOR'
alias -s txt='bat'
alias -s yaml='bat -l yaml'
#alias -s json=''


# global aliases
#alias -g WL="$HOME/Documents/cyber/ressource/wordlist"
#alias -g BAC="$HOME/Documents/bac"
