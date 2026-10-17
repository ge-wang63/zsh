# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @author  ge-wang63 (modified, 2026)
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# Print each entry of the PATH variable on a separate line
printpath() {
    local -a entries
    entries=("${(s/:/)PATH}")
    for entry in $entries; do
        print "$entry"
    done
}

# >>>>> 网络代理开关 start >>>>>
# 依赖 FlClash 监听 127.0.0.1:7890；proxyon 会先探测端口，避免设置成死代理。
# _proxy_port_open 定义在 environment.zsh（Linux: nc -z -w 1，无 nc 时 bash /dev/tcp）。
_PROXY_PORT=7890
_PROXY_NO_PROXY="localhost,127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,*.local,*.deepseek.com,*.aliyun.com,*.tsinghua.edu.cn,*.ustc.edu.cn"

proxyon() {
    if ! _proxy_port_open 127.0.0.1 $_PROXY_PORT; then
        print -u2 "proxyon: 127.0.0.1:$_PROXY_PORT 未监听（FlClash 未运行？）—— 未设置代理"
        return 1
    fi
    export HTTP_PROXY="http://127.0.0.1:$_PROXY_PORT"
    export HTTPS_PROXY="$HTTP_PROXY"
    export ALL_PROXY="$HTTP_PROXY"
    export NO_PROXY="$_PROXY_NO_PROXY"
    export http_proxy="$HTTP_PROXY" https_proxy="$HTTPS_PROXY" all_proxy="$ALL_PROXY" no_proxy="$NO_PROXY"
    print "proxy ON  ($HTTP_PROXY)"
}

proxyoff() {
    unset HTTP_PROXY HTTPS_PROXY ALL_PROXY NO_PROXY http_proxy https_proxy all_proxy no_proxy
    print "proxy OFF (直连)"
}

proxystatus() {
    if _proxy_port_open 127.0.0.1 $_PROXY_PORT; then
        print "FlClash 127.0.0.1:$_PROXY_PORT  LISTENING"
    else
        print "FlClash 127.0.0.1:$_PROXY_PORT  NOT listening"
    fi
    print "HTTP_PROXY  = ${HTTP_PROXY:-(unset)}"
    print "HTTPS_PROXY = ${HTTPS_PROXY:-(unset)}"
    print "ALL_PROXY   = ${ALL_PROXY:-(unset)}"
    print "NO_PROXY    = ${NO_PROXY:-(unset)}"
    if [[ -n "$HTTP_PROXY" ]]; then
        local port="${HTTP_PROXY##*:}"
        if _proxy_port_open 127.0.0.1 "$port"; then
            print "状态: 代理可用"
        else
            print "状态: ⚠️  死代理（变量已设但 $port 不可达）"
        fi
    fi
}
# <<<<< 网络代理开关 end <<<<<
