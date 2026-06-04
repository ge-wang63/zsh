# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE
export ZSH="$HOME/.oh-my-zsh"

# executable search path
export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/sbin:$PATH



# >>>>> Custom env variables start >>>>>

# >>> 自定义脚本 start >>>
export OWN_SCRIPT_BIN="~/.bin"
PATH="$OWN_SCRIPT_BIN:$PATH"
# >>> 自定义脚本 end >>>

export SOFT_DIR="/usr/local/software"
export TMP_DIR="$HOME/Tmp"
export NOTE_DIR="$HOME/Article/Note/collection/docs"

# <<<<< Custom env variables end <<<<<



# >>>>> Homebrew start >>>>>
export HOMEBREW_HOME="/opt/homebrew"
export PATH="$HOMEBREW_HOME/bin:$PATH"
# >>>>> Homebrew end >>>>>



# >>>>> GNU Tools start >>>>>

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

# >>>>> GNU Tools end >>>>>



# >>>>> Build Tools start >>>>>

# >>> gradle start >>>
export GRADLE_HOME=/opt/homebrew/opt/gradle
export GRADLE_USER_HOME=$HOME/.gradle
# <<< gradle end <<<

# >>> maven start >>>
export MAVEN_HOME=/opt/homebrew/opt/maven/libexec
export M2_HOME=/opt/homebrew/opt/maven/libexec
export MAVEN_OPTS="-Xss64m -Xmx1g -XX:ReservedCodeCacheSize=512m"
# <<< maven end <<<

# >>> nvm start >>>
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# <<< nvm end <<<

# <<<<< Build Tools end <<<<<



# >>>>> Software mana start >>>>>


# >>> sdkman start <<<
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# <<< sdkman end <<<

# <<<<< Software mana end <<<<<



# >>>>> BigData start >>>>>

# >>> hadoop start >>>
export HADOOP_HOME=/usr/local/software/hadoop-3.4.1
export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
export YARN_CONF_DIR="$HADOOP_HOME/etc/hadoop"
export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"
export HADOOP_CLASSPATH=`hadoop classpath`
# >>> hadoop end >>>

# >>> zookeeper start >>>
export ZOOKEEPER_HOME=/usr/local/software/zookeeper-3.7.1
export PATH="$PATH:$ZOOKEEPER_HOME/bin"
# >>> zookeeper end >>>

# >>> kafka start >>>
export KAFKA_HOME=/usr/local/software/kafka_2.13-4.2.0
export KAFKA_DATA_HOME=/Users/wangge/Tmp/Component/kafka
export PATH="$PATH:$KAFKA_HOME/bin"
# >>> kafka end >>>

# >>> elasticsearch start >>>
#export ES_HOME=/usr/local/software/elasticsearch-7.10.2
#export PATH="$PATH:$ES_HOME/bin"
# >>> elasticsearch end >>>

# >>> spark start >>>
export SPARK_HOME=/usr/local/software/spark-3.5.5-bin-hadoop3-scala2.13
export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
# <<< spark end <<

# >>> flink start >>>
export FLINK_HOME=/usr/local/software/flink-2.0.0
export PATH="$PATH:$FLINK_HOME/bin"
# <<< flink end <<

# >>> rocketmq start >>>
export ROCKETMQ_HOME=/usr/local/software/rocketmq-5.1.4
export PATH="$PATH:$ROCKETMQ_HOME/bin"
export rmq_store=$HOME/Tmp/System/rocketmq
# <<< rocketmq end <<<

# >>> airflow start >>>
export AIRFLOW_HOME=/usr/local/software/airflow
# <<< airflow end <<

# >>> kerberos start >>>
export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/sbin:$PATH"
export KRB5_CONFIG=/etc/krb5.conf
export KRB5_KDC_PROFILE=/var/krb5kdc/kdc.conf
# <<< kerberos end <<

# >>>>> BigData end >>>>>



# >>>>> Python start >>>>>

eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# >>>>> Python end >>>>>



# >>>>> Rust start >>>>>

export PATH=$HOME/.cargo/bin:$PATH

# >>>>> Rust end >>>>>



# >>>>> Others start >>>>>

# >>> mysql >>>
export PATH="$PATH:/usr/local/mysql/bin"
# <<< mysql <<<

# <<<<< Others end <<<<<
