# CODEX.md — Codex Agent 项目指南

## 项目概述

用户的 zsh 配置仓库，基于 XDG Base Directory 规范，使用 oh-my-zsh + powerlevel10k。
所有配置位于 `~/.config/zsh/`，主入口 `~/.zshrc` → `zshrc`（软链接）。

## 文件职责

| 文件 | 职责 |
|------|------|
| `zshrc` | 主入口，按序加载所有模块 |
| `environment.zsh` | 环境变量、PATH、SDK 路径 |
| `aliases.zsh` | 别名定义 |
| `functions.zsh` | 自定义 zsh 函数 |
| `options.zsh` | Shell 选项、按键绑定、历史 |
| `fzf.zsh` | fzf 模糊搜索集成 |
| `darwin.zsh` | macOS 专属配置 |
| `completion.zsh` | Tab 补全（已注释，未启用） |
| `prompt.zsh` | 已废弃，被 p10k 替代 |
| `private.final.zsh` | 私有密钥（gitignore） |
| `Makefile` | 安装脚本 |

## 规则

1. **不可修改 shell 配置文件**（`~/.zshrc`、`~/.bashrc` 等）— 任何 PATH/环境变量变更需先征得用户同意
2. 配置修改后用对应函数自动 source：`eedit`（环境）、`aedit`（别名）、`fedit`（函数）、`zedit`（zshrc）
3. Homebrew 镜像配置集中在 `environment.zsh` 第 67-69 行
4. 私有信息放 `private.final.zsh`，已 gitignore
5. `completion.zsh` 已注释，`prompt.zsh` 已废弃 — 两者都不应修改
