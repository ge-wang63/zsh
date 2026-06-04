# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# first include of the environment
source $HOME/.config/zsh/environment.zsh

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
# oh-my-zsh plugin
plugins=(
  git
  z
  extract
  zsh-syntax-highlighting
)

typeset -ga sources
sources+="$ZSH/oh-my-zsh.sh"
sources+="$ZSH_CONFIG/aliases.zsh"
sources+="$ZSH_CONFIG/private.zsh"
sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/options.zsh"

# completion config needs to be after system and private config
#sources+="$ZSH_CONFIG/completion.zsh"

# fzf integration and config
sources+="$ZSH_CONFIG/fzf.zsh"

# Check for a system specific file
systemFile=$(uname -s | tr "[:upper:]" "[:lower:]")
sources+="$ZSH_CONFIG/$systemFile.zsh"

# Private aliases and adoptions added at the very end (e.g. to start byuobu)
sources+="$ZSH_CONFIG/private.final.zsh"

# try to include all sources
foreach file ($sources)
    if [[ -e $file ]]; then
        source $file
    fi
end

if [[ -e $HOME/.iterm2_shell_integration.zsh ]]; then
    source $HOME/.iterm2_shell_integration.zsh
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh