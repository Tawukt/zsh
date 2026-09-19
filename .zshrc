#~~~~~~~~~~~ SOURCES
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/plugins.zsh"

#~~~~~~~~~~~ KITTY SHELL INTEGRATION
if [[ -n "$KITTY_INSTALLATION_DIR" ]]; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

#~~~~~~~~~~~ HISTORY OPTS
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$XDG_CACHE_HOME/zsh/zsh_history" # move histfile to cache
HIST_STAMPS="yyyy-mm-dd"
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS # consecutive duplicates are not saved
setopt HIST_IGNORE_SPACE # commands starting with space are not saved
setopt HIST_EXPIRE_DUPS_FIRST # expire old first
setopt HIST_FIND_NO_DUPS # no duplicate when looking history

#~~~~~~~~~~~ SHELL
setopt AUTOCD # go to directory when putting name without cd 
setopt NOBEEP
setopt NUMERIC_GLOB_SORT  # sort file10 after file9, not after file1

#~~~~~~~~~~~ COMPLETION
autoload -Uz compinit # Load completion system

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump" # Initialize completion with cached metadata file

zstyle ':completion:*' menu select # tab completion menu
zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} ma=0\;33 # colorize cmp menu
zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion

setopt NO_CASE_GLOB NO_CASE_MATCH # make cmp case insensitive


#~~~~~~~~~~~ BUFFER LINE EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line


#~~~~~~~~~~~ MAGIC SPACE
bindkey ' ' magic-space # sudo !! then space will replace !! by the previous command


#~~~~~~~~~~~ HISTORY SEARCH BY PREFIX
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search


#~~~~~~~~~~~ OTHER BINDS
bindkey "^[[3~" delete-char  # DEL key behaviour, it don't delete per default
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^[[1;5D" backward-word # ctrl+left
bindkey "^[[1;5C" forward-word # ctrl+right



#~~~~~~~~~~~ BEHAVIOR IF IN A FOLDER
# chpwd() {
#   ls
# }


#~~~~~~~~~~~ CONFIG FROM PYWALL
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

#~~~~~~~~~~~ MINICONDA
# I modify the lines bellow to speed up terminal initialisation
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
_conda_lazy_init() {
		# Unset alias so next calls go directly to the real conda
		unalias conda 2>/dev/null

		__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
		if [ $? -eq 0 ]; then
				eval "$__conda_setup"
		else
				if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
						. "/opt/miniconda3/etc/profile.d/conda.sh"
				else
						export PATH="/opt/miniconda3/bin:$PATH"
				fi
		fi
		unset __conda_setup

		# Now that conda is properly set up, call it with original args
		conda "$@"
}
alias conda='_conda_lazy_init'
# <<< conda initialize <<<

#~~~~~~~~~~~ STARSHIP INITIALISATION
eval "$(starship init zsh)"
