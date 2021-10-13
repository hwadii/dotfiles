[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=99999
SAVEHIST=90000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt extended_glob
setopt equals
setopt prompt_subst
setopt auto_cd
setopt interactivecomments
setopt auto_continue
setopt auto_param_slash
setopt pushd_ignore_dups
export DIRSTACKSIZE=20
setopt auto_pushd

stty -ixon -ixoff

bindkey -e

autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -U edit-command-line
zle -N edit-command-line

zreload() {
  local cache="$ZSH_CACHE_DIR"
  autoload -U compinit zrecompile
  compinit -i -d "$cache/zcomp-$HOST"

  for f in ${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST"; do
    zrecompile -p $f && command rm -f $f.zwc.old
  done

  [[ -n "$SHELL" ]] && exec ${SHELL#-} || exec zsh
}

autoload -U compaudit compinit

source $HOME/.zinit/bin/zinit.zsh

zinit ice wait lucid atload'_zsh_autosuggest_start'
zinit for \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
                zsh-users/zsh-history-substring-search \
                zsh-users/zsh-autosuggestions

zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZP::git
zinit snippet OMZP::fancy-ctrl-z
zinit snippet OMZL::completion.zsh
zinit snippet OMZP::dnf
zinit snippet OMZP::extract
zinit snippet https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
zinit ice as'program'
zinit as'completion' blockf for \
  light-mode \
    zsh-users/zsh-completions \
    https://github.com/alacritty/alacritty/blob/master/extra/completions/_alacritty \
    https://github.com/rust-lang/cargo/blob/master/src/etc/_cargo

DISABLE_UNTRACKED_FILES_DIRTY="true"
source $XDG_CONFIG_HOME/zsh/persent.zsh-theme
source $XDG_CONFIG_HOME/zsh/quick-open.zsh
source $XDG_CONFIG_HOME/zsh/aliases.zsh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

eval "$(zoxide init zsh)"
[ -f $HOME/dox/creds.zsh ] && source $HOME/dox/creds.zsh
[ -f ~/code/git/git-extras/etc/git-extras-completion.zsh ] && source ~/code/git/git-extras/etc/git-extras-completion.zsh

bindkey "^R" history-search-multi-word
if [[ -n "${terminfo[kcbt]}" ]]; then
  bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
fi
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[P' history-substring-search-up
bindkey '^[N' history-substring-search-down
bindkey "^Xa" _expand_alias
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
compinit -i
