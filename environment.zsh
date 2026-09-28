# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @author  ge-wang63 (modified, 2026)
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# XDG Base Directory Specification
# http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"



export ZSH_CONFIG="$XDG_CONFIG_HOME/zsh"
export ZSH_CACHE="$XDG_CACHE_HOME/zsh"
mkdir -p $ZSH_CACHE
export ZSH="$HOME/.oh-my-zsh"



# executable search path
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export HOMEBREW_HOME="/home/linuxbrew/.linuxbrew"
export PATH="$HOMEBREW_HOME/bin:$HOMEBREW_HOME/sbin:$PATH"



# >>> Custom env variables start >>>

## >>>>> WINDOWS 目录挂载 >>>>> 
export WIN_C="/mnt/c"
export WIN_D="/mnt/d"
## <<<<< WINDOWS 目录挂载 <<<<< 

# <<< Custom env variables end <<<



# >>> Software mana start >>>

# >>>>> homebrew start >>>>>
export HOMEBREW_AUTO_UPDATE_SECS=604800
#export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
## <<<<< homebrew end <<<<<

# >>>>> sdkman start >>>>>
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# <<<<< sdkman end <<<<<

# <<< Software mana end <<<



# >>> PL & BuildTool start >>>

# >>>>> jvm start >>>>>
export GRADLE_HOME=$HOME/.sdkman/candidates/gradle/current
export GRADLE_USER_HOME=$HOME/.gradle
#
export MAVEN_HOME="$HOME/.sdkman/candidates/maven/current"
export M2_HOME="$HOME/.sdkman/candidates/maven/current"
export MAVEN_OPTS="-Xss64m -Xmx1g -XX:ReservedCodeCacheSize=512m"
# <<<<< jvm end <<<<<

# >>> rust start >>>
#export RUSTUP_HOME="$HOME/.rustup"
#export CARGO_HOME="$HOME/.cargo"
#export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
#export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"
#export PATH="$HOME/.cargo/bin:$PATH"
# <<< rust end <<<

# >>>>> python start >>>>>
export UV_INDEX_URL="https://pypi.tuna.tsinghua.edu.cn/simple"
export UV_PYTHON_INSTALL_MIRROR="https://mirror.nju.edu.cn/github-release/astral-sh/python-build-standalone/"
# <<<<< python end <<<<<

# >>>>> node start >>>>>
export FNM_NODE_DIST_MIRROR="https://mirrors.aliyun.com/nodejs-release/"
eval "$(fnm env --use-on-cd --shell zsh)"
## >>> pnpm start >>>
#export PNPM_HOME="$XDG_DATA_HOME/pnpm"
#case ":$PATH:" in
#  *":$PNPM_HOME/bin:"*) ;;
#  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
#esac
# <<< pnpm end <<<
# <<<<< node end <<<<<

# <<< PL & BuildTool  end <<<



# >>>>> BigData start >>>>>

# >>> hadoop start >>>
#export HADOOP_HOME=/usr/local/software/hadoop-3.4.1
#export HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
#export YARN_CONF_DIR="$HADOOP_HOME/etc/hadoop"
#export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"
#export HADOOP_CLASSPATH=`hadoop classpath`
## >>> hadoop end >>>
#
## >>> zookeeper start >>>
#export ZOOKEEPER_HOME=/usr/local/software/zookeeper-3.7.1
#export PATH="$PATH:$ZOOKEEPER_HOME/bin"
## >>> zookeeper end >>>
#
## >>> elasticsearch start >>>
##export ES_HOME=/usr/local/software/elasticsearch-7.10.2
##export PATH="$PATH:$ES_HOME/bin"
## >>> elasticsearch end >>>
#
## >>> spark start >>>
#export SPARK_HOME=/usr/local/software/spark-3.5.5-bin-hadoop3-scala2.13
#export PATH="$PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin"
## <<< spark end <<
#
## >>> flink start >>>
#export FLINK_HOME=/usr/local/software/flink-2.0.0
#export PATH="$PATH:$FLINK_HOME/bin"
## <<< flink end <<
#
## >>> rocketmq start >>>
#export ROCKETMQ_HOME=/usr/local/software/rocketmq-5.1.4
#export PATH="$PATH:$ROCKETMQ_HOME/bin"
#export rmq_store=$HOME/Tmp/System/rocketmq
## <<< rocketmq end <<<
#
## >>> airflow start >>>
#export AIRFLOW_HOME=/usr/local/software/airflow
# <<< airflow end <<

# >>> kerberos start >>>
#export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
#export PATH="/opt/homebrew/opt/krb5/sbin:$PATH"
#export KRB5_CONFIG=/etc/krb5.conf
#export KRB5_KDC_PROFILE=/var/krb5kdc/kdc.conf
# <<< kerberos end <<

# >>>>> BigData end >>>>>



# >>>>> AI start >>>>>

export HERMES_HOME="$HOME/.hermes"
export HERMES_TUI=1
eval "$(hermes completion zsh)"

# >>> codex start >>>
#export CODEX_HOME="$HOME/.codex"
#export CODEX_SQLITE_HOME="$CODEX_HOME"
# <<< codex end <<<

export CREWAI_DISABLE_TELEMETRY=true

# <<<<< AI end <<<<<



# >>>>> Others start >>>>>

# >>> mysql >>>
#export PATH="$PATH:/usr/local/mysql/bin"
# <<< mysql <<<

# <<<<< Others end <<<<<
