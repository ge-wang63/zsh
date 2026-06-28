# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @author  ge-wang63 (modified, 2026)
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Option(meta ALT) Key Occupied by iTerm2
bindkey -r '^[c'
bindkey '^G' fzf-cd-widget

if type rg &> /dev/null; then
  #export FZF_DEFAULT_COMMAND='rg --hidden --files --glob "!.git" --glob "!Library" --glob "!node_modules" --glob "!.cache"'
  #export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --color=light --preview "bat --color=always {}" --preview-window "~3"'
  #export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --preview "bat --color=always {}" --preview-window "~10"'
fi

export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --exclude Library --exclude node_modules --exclude .cache'
export FZF_CTRL_T_COMMAND='fd --hidden --exclude .git --exclude Library --exclude node_modules --exclude .cache'
export FZF_COMPLETION_PATH_OPTS='--walker-skip=.cache,Library,node_modules,.git'
export FZF_ALT_C_COMMAND='fd --hidden --type d --exclude .git --exclude Library --exclude node_modules --exclude .cache'
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --preview "bat --color=always {}" --preview-window "~10"'
