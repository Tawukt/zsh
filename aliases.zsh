alias vim=nvim
alias l='eza -lahg --sort=name --icons=auto --group-directories-first'
alias ll='eza -lh --sort=name --icons=auto --group-directories-first'
alias ls='eza --sort=name --icons=auto --group-directories-first'
alias lt='eza --sort=name --icons=auto --group-directories-first --tree'

alias ..='cd ..'
alias ...='cd ../../'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias p="pacman"
alias t="tmux"

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

alias lbo="libreoffice"

alias lsblk="lsblk | bat --style=plain -l conf"
alias ps="ps | bat --style=plain -l conf" 
alias lsusb="lsusb | bat --style=plain -l conf"
alias df="df -h | bat --style=plain -l conf"


[[ "$TERM" == "xterm-kitty" ]] && alias ssh="TERM=xterm-256color ssh"
