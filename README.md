Zsh Configuration
================

基于 XDG Base Directory 规范的 Zsh 配置，使用 oh-my-zsh 框架 + powerlevel10k 主题。

## 安装

```sh
git clone https://github.com/ge-wang63/zsh.git ~/.config/zsh
cd ~/.config/zsh
make install
```

`make install` 会：链接 `~/.zshrc` → `~/.config/zsh/zshrc`、创建缓存目录、初始化子模块（如有）。

## 文件说明

| 文件 | 用途 | 状态 |
|---|---|---|
| `zshrc` | 主入口，按序加载所有模块 | ✅ |
| `environment.zsh` | 环境变量、PATH、SDK、Homebrew 镜像、语言运行时（JVM/Python/Node/大数据） | ✅ |
| `aliases.zsh` | 别名（git/docker/kubectl/fzf/全局后缀别名） | ✅ |
| `functions.zsh` | 自定义 zsh 函数 | ✅ |
| `options.zsh` | Shell 选项、按键绑定、历史记录 | ✅ |
| `fzf.zsh` | fzf 模糊搜索集成（搭配 ripgrep + bat） | ✅ |
| `darwin.zsh` | macOS 专属配置（`ls` 颜色） | ✅ |
| `private.final.zsh` | 私有密钥和令牌（gitignore 排除，不提交） | ✅ |
| `completion.zsh` | Tab 补全 zstyle 配置（compinit 由 oh-my-zsh 接管） | ✅ |
| `prompt.zsh` | 旧的自定义 prompt 实现 | 🗑️ 已被 p10k 替代 |

## 环境配置

`environment.zsh` 管理的核心内容：

### XDG 目录

`XDG_CONFIG_HOME`、`XDG_CACHE_HOME`、`XDG_DATA_HOME`、`XDG_STATE_HOME`

### 语言运行时

| 语言 | 工具 | 版本管理 | 镜像 |
|------|------|----------|------|
| JVM | Gradle, Maven | SDKMAN | — |
| Python | uv, uvx | uv 内置 | 清华 tuna |
| Node.js | fnm | fnm | 阿里云 |

### Homebrew

- 清华 tuna 镜像（API + Bottle）
- 自动更新间隔：1 周（`HOMEBREW_AUTO_UPDATE_SECS=604800`）

### 大数据工具

Hadoop, Spark, Flink, Kafka, HBase, Hive, Zookeeper, Airflow
（Kerberos 默认注释，按需启用）

### AI

`HERMES_TUI=1` — 启用 Hermes Agent 终端界面

## 依赖

| 工具 | 用途 |
|---|---|
| [oh-my-zsh](https://ohmyz.sh/) | Zsh 框架 |
| [powerlevel10k](https://github.com/romkatv/powerlevel10k) | Prompt 主题 |
| [fzf](https://github.com/junegunn/fzf) | 模糊搜索 |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | fzf 文件搜索后端 |
| [bat](https://github.com/sharkdp/bat) | fzf 文件预览 |
| [uv](https://docs.astral.sh/uv/) | Python 包管理 |
| [fnm](https://github.com/Schniz/fnm) | Node.js 版本管理 |
| GNU coreutils (Homebrew) | macOS 上提供 GNU `ls`/`dircolors` |

## 插件

通过 oh-my-zsh 加载：

| 插件 | 作用 |
|---|---|
| `git` | Git 别名和补全 |
| `z` | 目录快速跳转 |
| `extract` | 通用解压命令 |
| `zsh-syntax-highlighting` | 命令语法高亮 |

## 自定义函数

- `printpath` — 每行打印一个 PATH 条目
- `aedit` / `zedit` / `eedit` / `fedit` / `pedit` — 快速编辑对应配置文件并自动 source

## 目录

```
~/.config/zsh/
├── zshrc               # 主入口
├── environment.zsh     # 环境变量、PATH、运行时
├── aliases.zsh         # 别名
├── functions.zsh       # 函数
├── options.zsh         # 选项和按键绑定
├── fzf.zsh             # fzf 集成
├── darwin.zsh          # macOS 专属
├── completion.zsh      # 补全 zstyle 配置
├── private.final.zsh   # 私有密钥
├── Makefile            # 安装脚本
└── README.md
```
