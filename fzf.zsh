# @author  Sebastian Tramp <mail@sebastian.tramp.name>
# @author  ge-wang63 (modified, 2026)
# @license GPL-3.0 <https://www.gnu.org/licenses/gpl-3.0.txt>

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Option(meta ALT) Key Occupied by iTerm2
bindkey -r '^[c'
bindkey '^G' fzf-cd-widget

if type rg &> /dev/null; then
  #export FZF_DEFAULT_COMMAND='rg --hidden --files --glob "!.git" --glob "!Library" --glob "!node_modules" --glob "!.cache"'
  #export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --color=light --preview "bat --color=always {}" --preview-window "~3"'
  #export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --preview "bat --color=always {}" --preview-window "~10"'
fi

# 统一排除列表（fd 与 walker 共用，改一处全同步）
FZF_EXCLUDES=(.git node_modules .cache Pictures)

export FZF_DEFAULT_COMMAND="fd --hidden ${FZF_EXCLUDES[@]/#/--exclude }"
# ⚠️ FZF_CTRL_T_COMMAND 必须单独设置，不能只靠 FZF_DEFAULT_COMMAND：
#    key-bindings.zsh 中 __fzf_select() 执行 `FZF_DEFAULT_COMMAND=${FZF_CTRL_T_COMMAND:-}`，
#    未设置时展开为空字符串，临时覆盖默认命令 → Ctrl-T 退化为内置 walker（无排除规则）。
#    删除此行会让 Ctrl-T 搜出 .git/node_modules/.cache 等。FZF_ALT_C_COMMAND 同理。
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# FZF_COMPLETION_PATH_OPTS 服务 Tab 补全（输入 `**` + Tab，如 `cd **`、`vim **`）：
#    补全走 fzf 内置 walker（completion.zsh 第 178 行），不用 fd 命令，
#    因此排除规则须经 --walker-skip 单独传给 walker，与 FZF_EXCLUDES 同步维护。
export FZF_COMPLETION_PATH_OPTS="--walker-skip=${(j:,:)FZF_EXCLUDES}"
# FZF_ALT_C_COMMAND（Ctrl-G 目录跳转）独有 --no-ignore：目录跳转应无视 gitignore 搜出所有目录
#    （如 /opt/homebrew 的 .gitignore `/*` 会吞掉 Cellar）；文件搜索保持尊重 gitignore。
export FZF_ALT_C_COMMAND="fd --hidden --type d --no-ignore ${FZF_EXCLUDES[@]/#/--exclude }"
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --preview "bat --color=always {} 2>/dev/null || ls -la {}" --preview-window "~10"'
