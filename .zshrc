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

# Increase history size
HISTSIZE=100000               # Number of lines kept in memory
SAVEHIST=100000               # Number of lines saved to disk
HISTFILE=~/.zsh_history       # History file location

# History behavior options
setopt APPEND_HISTORY         # Append to the history file instead of overwriting it
setopt SHARE_HISTORY          # Share history across all sessions
setopt HIST_EXPIRE_DUPS_FIRST # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_DUPS       # Don’t record an entry that was just recorded again
setopt HIST_IGNORE_ALL_DUPS   # Remove all older duplicates
setopt HIST_FIND_NO_DUPS      # Do not display duplicates during history search
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks before recording
setopt EXTENDED_HISTORY       # Save timestamp + duration of commands

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
export OLLAMA_HOST="0.0.0.0:6969"
unset HTTP_PROXY
unset HTTPS_PROXY
unset http_proxy
unset https_proxy
export NO_PROXY="192.168.18.104,localhost,*.microsoft.com,github.com,*.github.com,pypi.org,aur.archlinux.org,drinkmorning.com,files.pythonhosted.org"
# export HTTPS_PROXY=""
# export HTTP_PROXY=""
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
export TMUX_CONF="$HOME/.config/.tmux"


tmux() {
    command tmux -f "$HOME/.config/.tmux/.tmux.conf" "$@"
}
fpath+=${ZDOTDIR:-~}/.zsh_functions

# bun completions
[ -s "/home/lazu/.bun/_bun" ] && source "/home/lazu/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export ROCM_PATH=/opt/rocm
export HSA_OVERRIDE_GFX_VERSION=10.3.0
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


[[ -s "/home/lazu/.gvm/scripts/gvm" ]] && source "/home/lazu/.gvm/scripts/gvm"
# export PIPEWIRE_CONFIG_DIR="/home/lazu/.config/pipewire"
export GIN_MODE=release
export OLLAMA_CMP_AI_URL="http://100.87.24.119:7869/api/generate"

nmcli_set_dns() {
  local conn
  conn=$(nmcli -t -f NAME connection show | fzf --prompt="Select connection: ") || return
  nmcli connection modify "$conn" ipv4.dns "100.96.19.74 100.80.129.124" && echo "DNS updated for '$conn'"
}
alias setdns="nmcli_set_dns"

nmcli_restart_connection() {
  local conn
  conn=$(nmcli -t -f NAME connection show | fzf --prompt="Select connection to restart: ") || return
  echo "Restarting connection: $conn"
  nmcli connection down "$conn" && nmcli connection up "$conn"
}
alias restartnet="nmcli_restart_connection"
