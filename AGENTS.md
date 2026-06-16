# AGENTS.md — Hermes Agent 项目指南

## 项目概述

这是用户的 zsh 配置仓库，基于 XDG Base Directory 规范，使用 oh-my-zsh + powerlevel10k。
所有配置文件位于 `~/.config/zsh/`，主入口 `~/.zshrc` 软链接到 `zshrc`。

## 文件职责

| 文件 | 职责 |
|------|------|
| `zshrc` | 主入口，按序加载所有模块 |
| `environment.zsh` | 环境变量、PATH、SDK 路径 |
| `aliases.zsh` | 别名定义 |
| `functions.zsh` | 自定义 zsh 函数 |
| `options.zsh` | Shell 选项、按键绑定、历史记录 |
| `fzf.zsh` | fzf 集成 |
| `darwin.zsh` | macOS 专属配置 |
| `completion.zsh` | Tab 补全（当前未启用） |
| `prompt.zsh` | 已被 powerlevel10k 替代，勿改 |
| `private.final.zsh` | 私有密钥，gitignore 排除 |
| `Makefile` | 安装脚本 |

## 核心约定

1. **不可修改用户 shell 配置文件** — `~/.zshrc`、`~/.bashrc` 等，任何涉及 PATH、环境变量、alias 的改动必须事先征得用户明确同意
2. **配置修改后必须 source** — 使用 `aedit`/`zedit`/`eedit` 等函数编辑会自动 source
3. **XDG 规范** — 配置缓存目录使用 `$XDG_CACHE_HOME`，默认 `~/.cache`
4. **Homebrew 镜像** — 所有 Homebrew 环境变量集中在 `environment.zsh` 第 67-69 行（清华 tuna 镜像），更新间隔 1 周

## 常用操作

```bash
# 编辑并自动 source
eedit    # environment.zsh
aedit    # aliases.zsh
fedit    # functions.zsh
zedit    # zshrc

# 安装/更新
make install

# 查看 PATH
printpath
```

## 注意事项

- `completion.zsh` 已整体注释，恢复需谨慎（性能影响）
- `prompt.zsh` 已废弃，所有 prompt 配置走 p10k
- 私有信息放 `private.final.zsh`（已 gitignore）
- `.hermes/` `.claude/` 等运行时目录本地使用，不提交到仓库
