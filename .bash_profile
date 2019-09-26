#!/bin/bash

# bash promt with time
export PS1="\t \h:\W \u\\$ "

# golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# preferred editor
export EDITOR='vim'

# brew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# python
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
    WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
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
source $HOME/.bash_aliases
source $HOME/.bash_functions
source $HOME/.bash_autocomplete
if [ -f $HOME/.bash_secrets ]; then
    source $HOME/.bash_secrets
fi
