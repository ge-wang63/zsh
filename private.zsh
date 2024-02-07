# >>> aliases start >>>
alias cman='man -M /usr/local/share/man/zh_CN'
alias filepath='readlink -f'
alias ip_simple="ifconfig en0 | grep 'inet ' | sed 's/^.*inet //g' | sed 's/ netmask.*$//g'"
# <<< aliases end <<<


# >>> 自定义脚本 start >>>
export OWN_SCRIPT_BIN="/Users/wangge/.bin"
PATH="$OWN_SCRIPT_BIN:$PATH"
# >>> 自定义脚本 end >>>


# >>> software dir >>>
export SOFT_DIR="/usr/local/software"
# <<< software dir <<<

export TMP_DIR=~/Tmp


# >>> homebrew env start >>>
export HOMEBREW_HOME="/opt/homebrew"
export PATH="$HOMEBREW_HOME/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE="1"
# >>> homebrew env end >>>


# >>> GNU start >>>
# coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
# findutils
export PATH="$(brew --prefix findutils)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix findutils)/libexec/gnuman:$MANPATH"
# GNU make
export PATH="$(brew --prefix make)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix make)/libexec/gnuman:$MANPATH"
# GNU tar
export PATH="$(brew --prefix gnu-tar)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix gnu-tar)/libexec/gnuman:$MANPATH"
# GNU sed
export PATH="$(brew --prefix gnu-sed)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix gnu-sed)/libexec/gnuman:$MANPATH"
# GNU awk
export PATH="$(brew --prefix gawk)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix gawk)/libexec/gnuman:$MANPATH"
# GNU which
export PATH="$(brew --prefix gnu-which)/libexec/gnubin:$PATH"
export MANPATH="$(brew --prefix gnu-which)/libexec/gnuman:$MANPATH"
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
alias java16='javahome 16'
alias java17='javahome 17'
alias java21='javahome 21'

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
export GRADLE_USER_HOME=$HOME/.gradle
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


# >>> coursier install directory >>>
export PATH="$PATH:/Users/wangge/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<


# >>> ruby start >>>
export PATH="/opt/homebrew/opt/ruby/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:$PATH"
#For compilers to find ruby
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
# For pkg-config to find rub
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
# <<< ruby end <<<
