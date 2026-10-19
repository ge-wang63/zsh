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
# >>>>> network proxy start >>>>>
# FlClash 7890（Ubuntu）；端口存活才导出，避免 FlClash 关闭后的死代理
# 本文件在 functions.zsh 之前被 source，故端口探测函数定义在此，供两处共用。
# Linux netcat 用 -w（连接超时）；macOS 的 -G 在 Linux 上不适用。无 nc 时回退 bash /dev/tcp。
# 启动 shell 时若 FlClash 未运行则不导出；之后启动 FlClash 可执行 `proxyon` 即时开启。
_proxy_port_open() {
  local host=${1:-127.0.0.1} port=${2:-7890}
  if command -v nc >/dev/null 2>&1; then
    nc -z -w 1 "$host" "$port" 2>/dev/null
  else
    timeout 1 bash -c "exec 3<>/dev/tcp/$host/$port" 2>/dev/null
  fi
}

if _proxy_port_open 127.0.0.1 7890; then
  export HTTP_PROXY="http://127.0.0.1:7890"
  export HTTPS_PROXY="http://127.0.0.1:7890"
  export ALL_PROXY="http://127.0.0.1:7890"
  export NO_PROXY="localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,*.local,*.deepseek.com,*.aliyun.com,*.tsinghua.edu.cn,*.ustc.edu.cn"
  export http_proxy="$HTTP_PROXY" https_proxy="$HTTPS_PROXY" all_proxy="$ALL_PROXY" no_proxy="$NO_PROXY"
fi
# <<<<< network proxy end <<<<<
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
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# <<< pnpm end <<<
# <<<<< node end <<<<<

# <<< PL & BuildTool  end <<<



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

source <(kubectl completion zsh)

# <<<<< Others end <<<<<
