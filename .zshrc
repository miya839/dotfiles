export Lang=ja_JP.UTF-8
export KCODE=u

autoload -Uz colors
colors

HISTFILE=~/.zsh=history
HISTSIZE=10000
SAVEHIST=10000
autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt list_packed          # コンパクトにする

setopt interactive_comments #

#ディレクトリ移動
setopt auto_cd              # コマンドがない場合その場でcdを試みる
setopt auto_pushd           # cdしたらカレントディレクトリをpushする

setopt pushd_ignore_dups    #

#Histry
setopt share_history        # 
setopt hist_ignore_all_dups # 以前と同じコマンドは保存しない
setopt hist_beep            # コマンドが存在しない場合通知する 
setopt hist_find_no_dups    # 以前見たものは２度表示しない
setopt hist_reduce_blanks   # 余分な空白を除去



bindkey '^R' history-incremental-pattern-search-backward

if which pbcopy >/dev/null 2>&1 ; then
    alias -g C-'| xsel --input --clipboard'
elif which xsel >/dev/null 2>&1 ; then
    alias -g C-'| pbcopy'
fi

source ~/.zplug/init.zsh

#プラグイン定義
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

#補完強化
zplug "zsh-users/zsh-completions"

#color設定
#zplug "kagamilove0707/moonline.zsh"
#zplug "Tarrasch/zsh-colors"
#zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
#zplug "Valodim/zsh-prompt-powerline"

#プラグインインストール
if ! zplug check --verbose; then 
	print "Install? [y/N]"
	if read -q; then
	  echo; zplug install
	fi
fi

zplug load --verbose

autoload -U promptinit; promptinit
prompt pure
