#!/bin/zsh
#
# Supposedly, .zprofile executes once at login and .zshrc for interactive
# shells, but on macOS all of these files will be executed for new Terminal
# tabs, so for the sake of simplicity - everything is defined here.
#
# https://unix.stackexchange.com/a/487889/7549

# promt with time
# http://www.nparikh.org/unix/prompt.php#zsh
export PS1='%* %m %1~ %# '

# save more commands in history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=5000
SAVEHIST=2000

# share history across multiple zsh sessions
setopt SHARE_HISTORY

# append to history
setopt APPEND_HISTORY

# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 

# do not store duplications
setopt HIST_IGNORE_DUPS

#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS

# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# preferred editor
export EDITOR='vim'

# brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# python
PYTHON_VERSION=3.8
export PATH="/Library/Frameworks/Python.framework/Versions/$PYTHON_VERSION/bin:$HOME/Library/Python/$PYTHON_VERSION/bin:$PATH"
if [ -f $HOME/Library/Python/$PYTHON_VERSION/bin/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_PYTHON="/Library/Frameworks/Python.framework/Versions/$PYTHON_VERSION/bin/python3"
    WORKON_HOME=$HOME/.virtualenvs
    source $HOME/Library/Python/$PYTHON_VERSION/bin/virtualenvwrapper.sh
fi

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# ruby
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# npm
export NPM_CONFIG_PREFIX=$HOME/.npm
export PATH=$NPM_CONFIG_PREFIX/bin:$PATH

# Use OpenSSL when building software
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# ripgrep
# --files list files, but do not search them
# --no-ignore do not respect .gitignore
# --ignore-case search case sensitively.
# --hidden search hidden files and folders
# --follow follow symlinks
# --glob additional options (ignore .git/)
export FZF_DEFAULT_COMAND="rg --files --no-ignore --ignore-case --hidden --follow --glob '!.git/' --glob '!.pytest_cache/' --glob '!*__pycache__*' --glob '!.eggs/' --glob '!*.egg-info/'"

# HashiCorp
export VAULT_ADDR=http://127.0.0.1:8200
export NOMAD_ADDR=http://127.0.0.1:4646
export CONSUL_HTTP_ADDR=127.0.0.1:8500

# load other dotfiles
source $HOME/.zsh_aliases
source $HOME/.zsh_functions
source $HOME/.zsh_autocomplete
if [ -f $HOME/.zsh_secrets ]; then
    source $HOME/.zsh_secrets
fi