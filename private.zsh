# >>> aliases start >>>
alias filepath='readlink -f'
# <<< aliases end <<<
# >>> 自定义脚本 start >>>
OWN_SCRIPT_BIN="/Users/wangge/Develop/Script/bin"
PATH="$OWN_SCRIPT_BIN:$PATH"
# >>> 自定义脚本 end >>>

# >>> homebrew env start >>>
export HOMEBREW_HOME="/opt/homebrew"
export PATH="$HOMEBREW_HOME/bin:$PATH"
# >>> homebrew env end >>>

# >>> GNU start >>>
if brew list --formula | grep coreutils > /dev/null ; then
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
fi
# >>> GNU end >>>

# >>> java start >>>
javahome() {
  unset JAVA_HOME
  JAVA_HOME=$(/usr/libexec/java_home -v "$1")
  PATH=$JAVA_HOME/bin:$PATH
  CLASSPATH=$JAVA_HOME/lib/tools.jar:$JAVA_HOME/lib/dt.jar
  export JAVA_HOME
  export PATH
  export CLASSPATH
}

alias java8='javahome 1.8'
alias java11='javahome 11'
alias java17='javahome 17'

java8
# <<< java end <<<

# >>> zookeeper start >>>
export ZOOKEEPER_HOME=/usr/local/software/zookeeper-3.7.1
export PATH="$PATH:$ZOOKEEPER_HOME/bin"
# >>> zookeeper end >>>

