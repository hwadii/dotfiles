# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() (
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview-window '~1' --preview "bat --style header,changes --color=always --decorations=always {} | head -500"))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)

# fs [FUZZY PATTERN] - Open the selected file with the default editor in a
# split
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" -d 50% --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
     nohup xdg-open "$file" &>/dev/null
  fi
}

# fgit [FUZZY PATTERN] - Open the modified file with the default editor
fgit() (
  IFS=$'\n' files=($(git status --short | awk '{ print $2 }' | fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview "bat --style numbers,changes --color=always --decorations=always {} | head -500"))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
)

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

fh() {
    print -z $( ([ -n "$ZSH_NAME"  ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//' )
}

# This script was automatically generated by the broot program
# More information can be found in https://github.com/Canop/broot
# This function starts broot and executes the command
# it produces, if any.
# It's needed because some shell commands, like `cd`,
# have no useful effect if executed in a subshell.
function br {
  f=$(mktemp)
  (
  set +e
  broot --outcmd "$f" "$@"
  code=$?
  if [ "$code" != 0 ]; then
    rm -f "$f"
    exit "$code"
  fi
)
code=$?
if [ "$code" != 0 ]; then
  return "$code"
fi
d=$(<"$f")
rm -f "$f"
eval "$d"
}

function open_command() {
  nohup xdg-open "$@" &>/dev/null
}
