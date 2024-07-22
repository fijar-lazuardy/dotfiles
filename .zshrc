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
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/share/npm/bin:$PATH"
export GIT_TERMINAL_PROMPT=1
export alias python3='python'
alias python="python3"
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
export HTTP_PROXY="http://192.168.18.108:6969"
export HTTPS_PROXY="http://192.168.18.108:6969"
export NO_PROXY="192.168.18.104,*.durianpay.id,localhost,*.microsoft.com"
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
export TMUX_CONF="$HOME/.config/.tmux"


tmux() {
    command tmux -f "$HOME/.config/.tmux/.tmux.conf" "$@"
}
fpath+=${ZDOTDIR:-~}/.zsh_functions
