# Setup fzf
# ---------
if [[ ! "$PATH" == *$(brew --prefix fzf)/bin* ]]; then
  export PATH="$PATH:$(brew --prefix fzf)/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$(brew --prefix fzf)/share/man* && -d "$(brew --prefix fzf)/share/man" ]]; then
  export MANPATH="$MANPATH:$(brew --prefix fzf)/share/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$(brew --prefix fzf)/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
FILE="$(brew --prefix fzf)/shell/key-bindings.zsh"
if [[ -a $FILE ]]; then
    source $FILE
fi

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --hidden --files'
  export FZF_DEFAULT_OPTS='-m'
fi
