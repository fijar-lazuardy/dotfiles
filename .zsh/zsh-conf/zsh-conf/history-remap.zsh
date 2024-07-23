function history-beginning-search-backward-end-of-line {
  local original_buffer_length=$#BUFFER
  zle history-beginning-search-backward
  if ((original_buffer_length == 0)); then
    CURSOR=$#BUFFER
  fi
}

function history-beginning-search-forward-end-of-line {
  local original_buffer_length=$#BUFFER
  zle history-beginning-search-forward
  if ((original_buffer_length == 0)); then
    CURSOR=$#BUFFER
  fi
}


zle -N history-beginning-search-backward-end-of-line
zle -N history-beginning-search-forward-end-of-line

bindkey "^[[A" history-beginning-search-backward-end-of-line
bindkey "^[[B" history-beginning-search-forward-end-of-line

