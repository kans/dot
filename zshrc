
# If you come from bash you might have to change your $PATH.
export PATH=/Users/mattkaniaris/Library/Python/2.7/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME=avit
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
unsetopt share_history
setopt INC_APPEND_HISTORY EXTENDED_HISTORY HIST_IGNORE_DUPS

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

parse_git_branch() {
    # returns '(git branch name) ' if inside git directory,
    # otherwise returns ''
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
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
alias gr="git gr"
alias emacs="emacs -nw"
alias ctl="kubectl"
alias slime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
export EDITOR='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl -nw'
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
alias kgit="GIT_SSH_COMMAND='ssh -o \"IdentitiesOnly=yes\" -i ~/.ssh/kans_rsa' git"
export LSCOLORS='gxfxcxdxcxegedabagacad'


git config --global alias.grog 'log --graph --abbrev-commit --decorate --all --format=format:"%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(dim white) - %an%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n %C(white)%s%C(reset)"'
git config --global alias.co 'checkout'
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH
# export DOCKER_TLS_VERIFY="1"
# export DOCKER_HOST="tcp://192.168.99.100:2376"
# export DOCKER_CERT_PATH="/Users/mattkaniaris/.docker/machine/machines/default"
# export DOCKER_MACHINE_NAME="default"
export NODE_REPL_HISTORY_FILE=/Users/mattkaniaris/.iorepl

# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
    # Load rupa's z if installed
    [ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
source ~/.git-completion.sh


export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


# export NVM_DIR="/Users/mattkaniaris/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

ssh-add -A
nvm use 16


# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# strap:straprc:begin
### strap
# [ -r "$HOME/.strap/etc/straprc" ] && . "$HOME/.strap/etc/straprc"
# strap:straprc:end


export PATH="$PATH:$HOME/.local/bin"
source $HOME/.cargo/env
PATH="/Users/mattkaniaris/perl5/bin${PATH:+:${PATH}}"; export PATH;
