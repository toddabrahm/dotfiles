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
export EDITOR=~/bin/vim
export HISTSIZE=1000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups
export GREP_OPTIONS='--color=auto'
export PATH="/usr/local/share/npm/bin:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/Dropbox/scripts/bin:${PATH}"
export PATH="$HOME/bin:${PATH}"
export PATH=$PATH:$HOME/.rvm/bin
[[ -s $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
[[ -s ~/.localrc ]] && source ~/.localrc
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
. `brew --prefix`/etc/profile.d/z.sh
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

# FASD
alias f='fasd -f'        # file
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias v='f -e vim'       # quick opening files with vim

# Apps
alias chrome="open -a Google\ Chrome"

# Global
alias -g L="| less"
alias -g G="| grep"
alias -g H="| head"
alias -g T="| tail"

# Packages
alias ni="npm install --save-dev"

alias mux=tmuxinator

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

# Collapsed pwd relative to $HOME
pwdr() {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Output single line
line() {
    sed -n $1p $2
}

# Make directory including parents and cd to it
mkc() {
    mkdir -p "$@" && cd "$@"
}

# Copy w/ progress
cp_p() {
  rsync -WavP --human-readable --progress $1 $2
}

# Inspect beg/end of file http://is.gd/vtliFU
i() {
    (head -n 5; tail -n 5) < "$1" | column -t
}

# Make sure file is plain text then copy to clipboard
clip() {
    type=`file "$1"|grep -c text`
    if [ $type -gt 0 ]; then
        cat "$@"|pbcopy
        echo "Contents of $1 are in the clipboard."
    else
        echo "File \"$1\" is not plain text."
    fi
}

# New named tmux session here with pwd as default-path
tmx() {
    tmux new -s $1 -c $PWD
}
