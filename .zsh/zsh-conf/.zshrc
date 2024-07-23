# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



source ~/.zsh/zsh-powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward

# Dracula settings
DRACULA_DISPLAY_TIME=1
DRACULA_DISPLAY_CONTEXT=1
DRACULA_DISPLAY_FULL_CWD=1


alias vim="nvim"
alias conf-vim="vim ~/.config/nvim"
#alias cdcode="cd $HOME/Documents/code.nosync"
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GOPATH="$HOME/code/golang"
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
export PATH="$HOME/.local/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# 👇️ make sure to update the path with the output
# # from the command
export PATH="/usr/local/share/npm/bin:$PATH"
export GOPRIVATE="github.com/durianpay"
export GIT_TERMINAL_PROMPT=1
export GEM_HOME=~/.ruby/
export PATH="$PATH:~/.ruby/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java"
export alias python3='python'
export PATH=/Users/lazzuuu/app/flutter/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk

#Tools exporting - it can be need in your case
export PATH=$PATH:$ANDROID_HOME/emulator:$PATH
export PATH=$PATH:$ANDROID_HOME/tools:$PATH
export PATH=$PATH:$ANDROID_HOME/tools/bin:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)
alias python="python3"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/Users/lazzuuu/.ebcli-virtual-env/executables:$PATH"
export PATH="/opt/homebrew/opt/go@1.18/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/alas.zsh
