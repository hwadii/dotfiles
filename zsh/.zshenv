skip_global_compinit=1
export LANG="en_US.UTF-8"
export SNAP="/snap"
export SWAYSOCK=$(find /run/user -name 'sway-ipc.*.sock' 2>/dev/null | head -n1)
export XDG_CURRENT_DESKTOP=sway
export XDG_SCREENSHOTS_DIR="$HOME/Images"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_LOCAL_BIN="$HOME/.local/bin"
export MONITOR="eDP-1"
export EXTERN_HOME="DP-1"
export EXTERN_WORK="HDMI-2"
export BROWSER="firefox-dev"
export LESS="--RAW-CONTROL-CHARS --mouse -Ri"
export XDG_CONFIG_HOME="$HOME/.config"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
export NVM_DIR="$HOME/.config/nvm"
export RVM_DIR="$HOME/.rvm"
export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.local/rustup"
export DEFAULT_PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export GEM_HOME="$RVM_DIR/gems/default"
export GEM_PATH="$RVM_DIR/gems/default"
export PATH="$XDG_LOCAL_BIN:$DEFAULT_PATH:$HOME/.config/nvm/versions/node/v15.8.0/bin:$HOME/.rvm/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$XDG_LOCAL_BIN/git-extras:$HOME/.local/texlive/2020/bin/x86_64-linux:$CARGO_HOME/bin:$GEM_HOME/bin:$RVM_DIR/rubies/default/bin"
export ZSH=$HOME/.oh-my-zsh
export SUDO_PROMPT=$'\e[35m[sudo]\e[33m password for %p:\e[0m '
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden -E".git"'
export FZF_DEFAULT_OPTS="
    --height 40%
    --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-s:toggle'
    --color fg+:italic,hl:-1:underline,hl+:-1:reverse:underline
"
export NOTE_DIR="$HOME/code/notes"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude '.git' --exclude 'node_modules'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
[[ -f ~/.npmrc ]] && export $(grep npm ~/.npmrc | awk -F \"  '{print "CDL_NPM_TOKEN="$2}')
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
