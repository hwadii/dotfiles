GIT_DIRTY_SYMBOL="*"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}$GIT_DIRTY_SYMBOL%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_BACKGROUND_JOB="%{$reset_color%}%B%F{yellow}%(1j.!.)%b%f%{$reset_color%}"
ZSH_PROMPT_CHAR=%B%(?.%F{cyan}.%F{red})❯%f%b

git_custom_status() {
  local cb=$(git_current_branch)
  if [ -n "$cb" ]; then
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(git_current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

PROMPT='%{$fg[gray]%}%B$(smart-pwd)%b%{$reset_color%}$(parse_git_dirty)$ZSH_BACKGROUND_JOB $ZSH_PROMPT_CHAR%{$reset_color%} '
RPROMPT='$(git_custom_status)'
