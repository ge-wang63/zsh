# >>> aliases start >>>
alias cman='man -M /usr/local/share/man/zh_CN'
alias filepath='readlink -f'
alias ip_simple="ifconfig en0 | grep 'inet ' | sed 's/^.*inet //g' | sed 's/ netmask.*$//g'"
# <<< aliases end <<<

# >>> 自定义脚本 start >>>
OWN_SCRIPT_BIN="/Users/wangge/.bin"
PATH="$OWN_SCRIPT_BIN:$PATH"
# >>> 自定义脚本 end >>>

# >>> homebrew env start >>>
export HOMEBREW_HOME="/opt/homebrew"
export PATH="$HOMEBREW_HOME/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE="1"
# >>> homebrew env end >>>
#

export TMP_DIR=~/Tmp

# >>> GNU start >>>
if brew list --formula | grep coreutils > /dev/null ; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
fi
# >>> GNU end >>>

# >>> java start >>>

javahome() {
  unset JAVA_HOME
  export JAVA_HOME=$(/usr/libexec/java_home -v "$1")
  export PATH=$JAVA_HOME/bin:$PATH
  export CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
}

alias java8='javahome 1.8'
alias java11='javahome 11'
alias java17='javahome 17'

java17
# <<< java end <<<

# >>> zookeeper start >>>
export ZOOKEEPER_HOME=/usr/local/software/zookeeper-3.7.1
export PATH="$PATH:$ZOOKEEPER_HOME/bin"
# >>> zookeeper end >>>

# >>> kafka start >>>
export KAFKA_HOME=/usr/local/software/kafka_2.13-3.4.0
export PATH="$PATH:$KAFKA_HOME/bin"
# >>> kafka end >>>

# >>> gradle start >>>
export GRADLE_USER_HOME=~/.gradle
# <<< gradle end <<<

# >>> maven start >>>
export MAVEN_HOME=/opt/homebrew/opt/maven/libexec
export M2_HOME=/opt/homebrew/opt/maven/libexec
# <<< maven end <<<

# >>> nvm start >>>
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# <<< nvm end <<<
