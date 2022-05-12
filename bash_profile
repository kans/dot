#export PS1="\u@\w# "

parse_git_branch() {
    # returns '(git branch name) ' if inside git directory,
    # otherwise returns ''
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}


if [ "$PS1" ]; then
    export PS1='-----------------------------------------------------------\d \t\n\[\033]0;\w\007\033[32m\]\u@\h \[\033[33m\w\033[0m\]\n$(parse_git_branch)$ '
    export INTERACTIVE_SHELL=1
else
    export INTERACTIVE_SHELL=0
fi

function wo() {
  source ~/venv/$1/bin/activate
  unset PYTHONPATH
}

function git_current_branch() {
  git symbolic-ref HEAD 2> /dev/null | sed -e 's/refs\/heads\///'
}

function git_current_origin() {
  git ls-remote --get-url | sed -e 's/^.*\://' | sed -e 's/\.git.*//'
}

# function workon() {
#   unset PYTHONPATH
#   activate "~/venv/$1/bin/activate"
# }
# create a github pull request from the current branch
alias gpr='open "https://github.com/$(git_current_origin)/pull/new/$(git_current_branch)"'
alias glu='git ls-files --other --exclude-standard'
alias gd='git diff'
alias gs='git status'
alias emacs="emacs -nw"
alias ctl="kubectl"
export EDITOR="slime -nw"
alias co="git checkout "
alias branch="git branch"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias sync_virgo="cd /racker/virgo && notify_loop.sh . rsync -avz --exclude=out/* . kans@ele:~/Dev/ele"
alias sync_ele="notify_loop.sh /racker/ele rsync -avz --exclude=out/* . kans@ele:~/Dev/ele/ && notify_loop.sh /racker/virgo rsync -avz --exclude=out/* . kans@ele:~/Dev/virgo/ "
alias sha1sum="shasum"
alias ls='ls -GF'
alias slime='/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl'
export LSCOLORS='gxfxcxdxcxegedabagacad'


git config --global alias.grog 'log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
git config --global alias.co 'checkout'
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/kans/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
export NODE_REPL_HISTORY_FILE=/Users/kans/.iorepl

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
    # Load rupa's z if installed
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
source ~/.git-completion.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# export NVM_DIR="/Users/kans/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

ssh-add -A
nvm use 10
export PATH="/usr/local/opt/icu4c/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export SFT_DEPLOY_AUTHOR="kans"
export SFT_DEPLOY_AUTHOR="matt.kaniaris@okta.com"
export SFT_DEPLOY_REPO="ScaleFT/deploy-prod"
# strap:strapenv:begin
[ -r "$HOME/.strap/etc/strapenv" ] && . "$HOME/.strap/etc/strapenv"
# strap:strapenv:end

# strap:bashrc:begin
# source .bashrc from within .bash_profile per bash user guide:
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
[[ -r "$HOME/.bashrc" ]] && . "$HOME/.bashrc"
# strap:bashrc:end

. "$HOME/.cargo/env"
