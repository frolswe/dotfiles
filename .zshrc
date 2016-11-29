# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# Set theme manually after oh-my-zsh.sh is sourced.
ZSH_THEME=""

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(history-substring-search)

source $ZSH/oh-my-zsh.sh

# Theme oh-my-zsh
PROMPT='%{$fg_bold[red]%}➜  %{$fg[cyan]%}%~ %{$fg_bold[blue]%}$(git_prompt_info) %{$fg_bold[blue]%}%# %{$reset_color%}'
if [[ $SSH_CONNECTION != "" ]]; then
  ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"
else
  ZSH_THEME_TERM_TITLE_IDLE="%~"
fi
ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
function title {
  if [[ "$DISABLE_AUTO_TITLE" == "true" ]] || [[ "$EMACS" == *term* ]]; then
    return
  fi
  if [[ "$TERM" == screen* ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\ek$1:q\e\\" #set tab name
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

# Inherit some ssh session environment into screen environment.
alias screen="typeset -pm SSH_AUTH_SOCK SSH_CONNECTION DISPLAY >$HOME/.ssh/screen-environment; screen"
function screen_source_env () {
    source $HOME/.ssh/screen-environment
}
if [[ "$TERM" == screen* ]]; then
    preexec_functions+=screen_source_env
    screen_source_env
fi

export VISUAL=vim
export LESS=cSMnqifR
eval $(lesspipe)

export EMAIL=frol@hupp.se
if [[ -n "$SSH_AUTH_SOCK" && $(ssh-add -l) == *anyfi* ]]; then
    EMAIL=fredrik.olofsson@anyfinetworks.com
fi

bindkey "${terminfo[kcuu1]}" history-substring-search-up
bindkey "${terminfo[kcud1]}" history-substring-search-down
