function history-beginning-search-backward-end-of-line {
  zle history-beginning-search-backward
  CURSOR=$#BUFFER
}

function history-beginning-search-forward-end-of-line {
  zle history-beginning-search-forward
  CURSOR=$#BUFFER
}

zle -N history-beginning-search-backward-end-of-line
zle -N history-beginning-search-forward-end-of-line

bindkey "^[[A" history-beginning-search-backward-end-of-line
bindkey "^[[B" history-beginning-search-forward-end-of-line
