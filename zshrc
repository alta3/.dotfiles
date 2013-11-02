DISABLE_AUTO_TITLE=true
ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_THEME="cm"

plugins=(git virtualenv python golang tmux docker)

source $ZSH/oh-my-zsh.sh

# -------------------------------------- #
# --------------Exports----------------- #

path=(
    $path
    ~/development/gocode/bin
    ~/development/gocode/src/github.com/dotcloud/docker/docker
    /usr/local/bin
    ~/.dotfiles/bin
    ~/.dotfiles/local/bin
    /usr/bin
    /bin
    /usr/sbin
    /sbin
    /opt/X11/bin
    ~/.local/depot_tools
    ~/go/bin
)

export GOROOT=$HOME/go
export GOBIN=$GOROOT/bin
export GOPATH=$HOME/development/gocode
export PKG_CONFIG_PATH=$HOME/.dotfiles/local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/.dotfiles/local/lib

# -------------------------------------- #
# --------------Aliases----------------- #

alias gs='git status -u'
alias gmt='git mergetool'
alias gc='git commit'
alias gca='git commit -a'
alias gb='git branch -v -v'
alias gaa='git add .'
alias gco='git checkout'
alias glg='git log --graph --stat --oneline --decorate'
alias gl='git log --graph --oneline --decorate'
alias gm='git merge --no-ff'
alias gtk='gitk'
alias gcl='git clone'
alias gpo='git push origin'
alias gp='git push'
alias gd='git diff'
alias gsl='git stash list'
alias gsa='git stash apply'
alias gpull='git pull'
alias gpullo='git pull origin'
alias gremotes='git remote -v'
alias gcount='git count-objects -H'
alias addlast='git commit --amend –C HEAD'
alias gcount='git fetch --all'
alias resetmaster='git fetch && git reset --hard origin/master'
alias gls='git stash list'

alias ztar='tar -zcvf'
alias uztar='tar -zxvf'
alias lstar='tar -ztvf'
alias 7za='7z a'
alias cd..='cd ..'
alias cl='clear'
alias md='mkdir'
alias rd='rmdir'
alias back='popd'

alias encrypt='openssl aes-256-cbc -a -salt '
alias decrypt='openssl aes-256-cbc -d -a '

alias pychecker='pychecker -L 50 -R 4 -J 6 '
alias markdown='markdown_py'
alias createenv='virtualenv --no-site-packages '

alias godebug='go build -gcflags "-N -l"'
alias godocserver='godoc -http=:8111'
alias buildall='go build -v . ./...'
alias installall='go install . ./...'
alias gobi='buildall && installall'

alias attach='tmux attach-session -t 0'
alias listinstalled='dpkg --get-selections'

# Iptables
alias iptbleshow='iptables -L -n -t nat'
alias lsa='ls -lah --color=auto'
alias ls='ls -lh --color=auto'

setopt no_share_history

# ----------------Scripts-------------------#
# Marks http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

# Source go cross compile
source ~/.dotfiles/bin/crosscompile.bash
