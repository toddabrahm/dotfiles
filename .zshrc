# ----------------------------------------------------------------
# SETTINGS & ENV
# ----------------------------------------------------------------
stty -ixon
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dontblinks"
DISABLE_AUTO_UPDATE="true"
plugins=(git vi-mode osx)
source $ZSH/oh-my-zsh.sh
if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi
unsetopt correct_all
export TERM=xterm-256color
export EDITOR=~/bin/vim
export HISTSIZE=1000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups
export GREP_OPTIONS='--color=auto'
export PATH="/usr/local/share/npm/bin:${PATH}"
export PATH="$HOME/Dropbox/scripts:${PATH}"
export PATH="$HOME/Dropbox/scripts/tmux:${PATH}"
export PATH="/usr/local/bin:${PATH}"
export PATH="$HOME/bin:${PATH}"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# z is the new j http://is.gd/JoQGaT
. `brew --prefix`/etc/profile.d/z.sh

# fasd
eval "$(fasd --init auto)"

# less syntax highlighting
LESSPIPE=`which src-hilite-lesspipe.sh`
export LESSOPEN="| ${LESSPIPE} %s"
export LESS='-R'

# ----------------------------------------------------------------
# ALIASES & BINDINGS
# ----------------------------------------------------------------

# History completion
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

alias sudo="sudo "

alias l="ls -1"        # One line, no hiddens
alias ll="ls -hola"    # Multi-line, hiddens, no group, file-size
alias la="ls -a"       # One line, hiddens
alias lt="ls -Goth"    # Multi-line, no hiddens, last modified, no group, file-size
alias lat="ls -Goath"  # Multi-line, hiddens, last modified, no group, file-size
alias catn="cat -n"    # Concat with line numbers
alias chrome="open -a Google\ Chrome"

# Global aliases
alias -g L="|less"
alias -g G="|grep"

# Packages
alias brewer="brew update && brew upgrade && brew cleanup && brew doctor"
alias vimupdate="vim +BundleInstall! +qall"

# FASD
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim

# OS X-only
if [[ "$OSTYPE" == darwin* ]]; then
  alias c='pbcopy'
  alias p='pbpaste'
  alias rm='trash'
  alias flushdns="dscacheutil -flushcache"
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
  alias emptylogs="sudo rm -rfv /private/var/log/asl/*.asl"
fi

# ----------------------------------------------------------------
# FUNCTIONS
# ----------------------------------------------------------------

# new named tmux session here with pwd as default-path
tmx () {
    tmux new -s $1 -c $PWD
}

# collapsed pwd relative to $HOME
pwdr () {
    echo $(pwd | sed -e "s,^$HOME,~,")
}

# Colorize less and cat output with Pygments
lessp () {
    pygmentize -O style=solarized -f console256 -g "$1" | less
}
catp () {
    pygmentize -O style=solarized -f console256 -g "$1"
}

# Output single line
line () {
    sed -n $1p $2
}

# mkdir && cd ex. mkc foo/bar/baz
mkc () {
    mkdir -p "$@" && cd "$@"
}

# inspect beg/end of file http://is.gd/vtliFU
i () {
    (head -n 5; tail -n 5) < "$1" | column -t
}

# make sure file is plain text then copy to clipboard
clip () {
    type=`file "$1"|grep -c text`
    if [ $type -gt 0 ]; then
        cat "$@"|pbcopy
        echo "Contents of $1 are in the clipboard."
    else
        echo "File \"$1\" is not plain text."
    fi
}

# copy input file to clipboard as base64
b64() {
    cat $1 | openssl enc -base64 | tr -d '\n' | pbcopy
}

# fetch ip info
geoip () {
    curl -s http://freegeoip.net/json/$1 | jq '.'
}

# URL encode and echo
function url-encode () {
        setopt extendedglob
        echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# search google
function google () {
       chrome "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}

# ----------------------------------------------------------------
# Misc
# ----------------------------------------------------------------

# Tetris for productivity purposes
autoload -U tetris
zle -N tetris
bindkey "^T" tetris
