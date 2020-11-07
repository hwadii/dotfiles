export TERM="xterm-256color"
export SNAP="/snap"
export MONITOR="eDP-1"
export EXTERN_HOME="DP-1"
export EXTERN_WORK="HDMI-2"
export BROWSER="firefox"
export LESS="--RAW-CONTROL-CHARS --mouse -Ri"
export XDG_CONFIG_HOME="$HOME/.config"
export BIN=$HOME/bin
export NVM_DIR="$HOME/.config/nvm"
export RVM_DIR="$HOME/.rvm"
export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.local/rustup"
export DEFAULT_PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
export GEM_HOME="$RVM_DIR/gems/ruby-2.7.2"
export PATH="$BIN:$HOME/.local/bin:$HOME/.config/nvm/versions/node/v14.12.0/bin:$HOME/.rvm/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$BIN/git-extras:$HOME/.local/texlive/2020/bin/x86_64-linux:$CARGO_HOME/bin:$RVM_DIR/gems/ruby-2.7.2/bin:$RVM_DIR/rubies/default/bin:$PATH"
export ZSH=$HOME/.oh-my-zsh
export SUDO_PROMPT=$'\e[35m[sudo]\e[33m password for %p:\e[0m '
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden -E".git"'
export FZF_DEFAULT_OPTS="
    --height 40%
    --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-s:toggle'
"
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export $(grep npm.cardiologs.com/:_authToken ~/.npmrc|awk -F \"  '{print "CDL_NPM_TOKEN="$2}')

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="persent"
plugins=(git gitfast dnf tmux extract zsh-syntax-highlighting wd fancy-ctrl-z)

source $ZSH/oh-my-zsh.sh

bindkey "^Xa" _expand_alias

[ -f $HOME/Documents/creds.zsh ] && source $HOME/Documents/creds.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/code/git/git-extras/etc/git-extras-completion.zsh ] && source ~/code/git/git-extras/etc/git-extras-completion.zsh
