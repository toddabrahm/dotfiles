# ----------------------------------------------------------------
# GENERAL
# ----------------------------------------------------------------

stty -ixon
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dontblinks"
DISABLE_AUTO_UPDATE="true"
plugins=(git git-extras vi-mode osx vagrant)
fpath=(/usr/local/share/zsh-completions $fpath)
export TERM=xterm-256color
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export HISTSIZE=1000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups
export GREP_OPTIONS='--color=auto'
export PATH="/usr/local/share/npm/bin:${PATH}"
export PATH="$HOME/.composer/vendor/bin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"              # homebrew ruby
export PATH="/usr/local/lib/ruby/gems/2.5.0/bin:$PATH"   # homebrew ruby gems
export PATH="$HOME/Dropbox/scripts/bin:${PATH}"
[[ -s $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--color 16 --extended'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
eval "$(fasd --init auto)"
unsetopt correct_all

# ----------------------------------------------------------------
# BINDINGS
# ----------------------------------------------------------------

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
bindkey -M vicmd v edit-command-line

# ----------------------------------------------------------------
# ALIASES
# ----------------------------------------------------------------

# General
alias l="ls -1"          # One line, no hiddens
alias ll="ls -hola"      # Multi-line, hiddens, no group, file-size
alias la="ls -a"         # One line, hiddens
alias du="du -h -d 2"    # Human readable disk usage
alias df="df -h"         # Human readable free space

# Apps
alias vim="nvim"
alias mux=tmuxinator
alias chrome="open -a Google\ Chrome"

# Global
alias -g L="| less"
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"

# Packages
alias ni="npm install --save-dev"

# OS X-only
if [[ "$OSTYPE" == darwin* ]]; then
  alias rm='trash'
  alias pgrep='pgrep -fli'
  alias flushdns="dscacheutil -flushcache"
fi

# ----------------------------------------------------------------
# FUNCTIONS
# ----------------------------------------------------------------

# Find shorthand (also suppressing errors)
fnd() {
    find . -name "$1" 2>/dev/null
}

# Make directory including parents and cd to it
mkc() {
    mkdir -p "$@" && cd "$@"
}

# New named tmux session here with pwd as default-path
tmx() {
    tmux new -s $1 -c $PWD
}

[[ -s ~/.localrc ]] && source ~/.localrc
