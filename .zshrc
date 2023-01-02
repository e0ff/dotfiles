zstyle :compinstall filename '~/.zshrc'

if [[ -f $(which virtualenvwrapper.sh) ]]; then
    source $(which virtualenvwrapper.sh)
fi

autoload -Uz compinit
compinit

autoload -Uz zsh-add-hook

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=$HISTSIZE

source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
zplug "hlissner/zsh-autopair", defer:2
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "softmoth/zsh-vim-mode"

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='none'

if ! zplug check --verbose; then
    print "Install [y/n]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

for file in ~/.zsh/*.zsh; do
    source "${file}"
done

if [[ -f ~/.config/aliases ]]; then
    source ~/.config/aliases
fi

setopt appendhistory
setopt correct
setopt interactivecomments
setopt no_beep

unsetopt autocd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
