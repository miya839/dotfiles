
autoload -Uz colors
colors

HISTFILE=~/.zsh=history
HISTSIZE=10000
SAVEHIST=10000
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


setopt print_eight_bit

setopt interactive_comments

setopt auto_cd

setopt pushd_ignore_dups

setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

bindkey '^R' history-incremental-pattern-search-backward

if which pbcopy >/dev/null 2>&1 ; then
    alias -g C-'| xsel --input --clipboard'
elif which xsel >/dev/null 2>&1 ; then
    alias -g C-'| pbcopy'
fi


