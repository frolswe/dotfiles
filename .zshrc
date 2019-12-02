# Path to your oh-my-zsh installation.
export ZSH="/home/frol/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git history-substring-search zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export VISUAL=vim
export LESS=cSMnqifR
eval $(lesspipe)

export EMAIL=frol@hupp.se
if [[ -n "$SSH_AUTH_SOCK" && $(ssh-add -l) == *anyfi* ]]; then
    EMAIL=fredrik.olofsson@anyfinetworks.com
fi

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
