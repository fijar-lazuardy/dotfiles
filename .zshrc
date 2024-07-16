# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

source ~/.zsh/zsh-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^[[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Dracula settings
DRACULA_DISPLAY_TIME=1
DRACULA_DISPLAY_CONTEXT=1
DRACULA_DISPLAY_FULL_CWD=1


alias vim="nvim"
alias conf-vim="cd ~/.config/nvim && vim ~/.config/nvim"
#alias cdcode="cd $HOME/Documents/code.nosync"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
# 👇️ make sure to update the path with the output
# # from the command
export PATH="/usr/local/share/npm/bin:$PATH"
export GIT_TERMINAL_PROMPT=1
export GEM_HOME=~/.ruby/
export PATH="$PATH:~/.ruby/bin"
export alias python3='python'
export PATH=/Users/lazzuuu/app/flutter/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk

#Tools exporting - it can be need in your case
export PATH=$PATH:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
alias python="python3"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/lazzuuu/.ebcli-virtual-env/executables:$PATH"
export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export MUSIC_APP="Music"
source ~/.zsh-aliases
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fnm
FNM_PATH="/home/lazu/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/lazu/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

GVM_PATH="/home/lazu/.gvm"
if [ -d "$GVM_PATH" ]; then
  export PATH="/home/lazu/.gvm:$PATH"
  source ~/.gvm/scripts/gvm
fi

export GOPRIVATE="github.com/durianpay"
export GO111MODULE=on
export PATH="$PATH:$(go env GOPATH)/bin"
export MUSIC_APP=$(playerctl -l | grep tidal-hifi)
if [[ -z "$MUSIC_APP" ]]; then
    export MUSIC_APP=$(playerctl -l | grep chromium)
fi
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
export TMUX_CONF="$HOME/.config/.tmux"
