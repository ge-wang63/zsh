# take tike to measure boot time
bootTimeStart=$(gdate +%s%N 2>/dev/null || date +%s%N)


# first include of the environment
source $HOME/.config/zsh/environment.zsh

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

typeset -ga sources
sources+="$ZSH/oh-my-zsh.sh"
sources+="$ZSH_CONFIG/environment.zsh"
#sources+="$ZSH_CONFIG/options.zsh"
#sources+="$ZSH_CONFIG/prompt.zsh"
#sources+="$ZSH_CONFIG/functions.zsh"
sources+="$ZSH_CONFIG/aliases.zsh"

# Check for a system specific file
systemFile=`uname -s | tr "[:upper:]" "[:lower:]"`
sources+="$ZSH_CONFIG/$systemFile.zsh"

# Private aliases and adoptions
sources+="$ZSH_CONFIG/private.zsh"

# completion config needs to be after system and private config
#sources+="$ZSH_CONFIG/completion.zsh"

# fzf integration and config
sources+="$ZSH_CONFIG/fzf.zsh"

# Private aliases and adoptions added at the very end (e.g. to start byuobu)
#sources+="$ZSH_CONFIG/private.final.zsh"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end


bootTimeEnd=$(gdate +%s%N 2>/dev/null || date +%s%N)
bootTimeDuration=$((($bootTimeEnd - $bootTimeStart)/1000000))
echo $bootTimeDuration ms overall boot duration

