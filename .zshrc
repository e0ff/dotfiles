zstyle :compinstall filename '/home/endoffile/.zshrc'

export PATH="$PATH:$HOME/bin/"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

source ~/.zplug/init.zsh

zplug "zplug/zplug"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"
#zplug "plugins/git-prompt", from:oh-my-zsh, if:"which git"

if ! zplug check --verbose; then
	print "Install [y/n]: "
	if read -q; then
		echo; zplug install
	fi
fi

zplug load

source ~/.zsh/aliases.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/functions.zsh

if [[ -f "$HOME/.zsh/private.zsh" ]]; then
	source ~/.zsh/private.zsh
fi

setopt appendhistory
unsetopt autocd
