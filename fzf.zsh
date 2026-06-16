# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# Setup fzf
# ---------
#if [[ ! "$PATH" == *$(brew --prefix fzf)/bin* ]]; then
#  export PATH="$PATH:$(brew --prefix fzf)/bin"
#fi
#
## Man path
## --------
#if [[ ! "$MANPATH" == *$(brew --prefix fzf)/share/man* && -d "$(brew --prefix fzf)/share/man" ]]; then
#  export MANPATH="$MANPATH:$(brew --prefix fzf)/share/man"
#fi
#
## Auto-completion
## ---------------
#[[ $- == *i* ]] && source "$(brew --prefix fzf)/shell/completion.zsh" 2> /dev/null
#
## Key bindings
## ------------
#FILE="$(brew --prefix fzf)/shell/key-bindings.zsh"
#if [[ -a $FILE ]]; then
#    source $FILE
#fi

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --hidden --files'
  export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --color=light --preview "bat --color=always {}" --preview-window "~3"'
fi
