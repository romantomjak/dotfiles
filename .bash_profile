# brew apps go first
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.7/bin/python3
    WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# ruby gems
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# npm
export NPM_CONFIG_PREFIX=$HOME/.npm
export PATH=$NPM_CONFIG_PREFIX/bin:$PATH

# ssh autocomplete
function _ssh_autocomplete() {
    COMPREPLY=()
    CURRENT_WORD="${COMP_WORDS[COMP_CWORD]}"
    if [[ ${CURRENT_WORD} == -* || ${COMP_CWORD} -eq 1 ]] ; then
        WORD_LIST=$(sed -nE "s/Host\ ([a-zA-Z0-9].+)/\1/p" ~/.ssh/config | tr '\n' ' ' )
        COMPREPLY=( $(compgen -W "$WORD_LIST" -- ${CURRENT_WORD}) )
    fi
}
complete -F _ssh_autocomplete ssh

# makefile autocomplete
function _makefile_targets {
    local curr_arg;
    local targets;

    # Find makefile targets available in the current directory
    targets=''
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$( \
            grep -oE '^[a-zA-Z0-9_-]+:' Makefile \
            | sed 's/://' \
            | tr '\n' ' ' \
        )
    fi

    # Filter targets based on user input to the bash completion
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(compgen -W "${targets[@]}" -- $curr_arg ) );
}
complete -F _makefile_targets make

# preferred editor
export EDITOR='vim'

# load other dotfiles
source $HOME/.bash_aliases

# python
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH

# git autocomplete (for git bundled with command-line tools) 
if [ -f `xcode-select -p`/usr/share/git-core/git-completion.bash ]; then
    . `xcode-select -p`/usr/share/git-core/git-completion.bash
fi

# ripgrep
# --files list files, but do not search them
# --no-ignore do not respect .gitignore
# --ignore-case search case sensitively.
# --hidden search hidden files and folders
# --follow follow symlinks
# --glob additional options (ignore .git/)
export FZF_DEFAULT_COMAND="rg --files --no-ignore --ignore-case --hidden --follow --glob '!.git/' --glob '!.pytest_cache/' --glob '!*__pycache__*' --glob '!.eggs/' --glob '!*.egg-info/'"


# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/romantomjak/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH

# Use OpenSSL when building software
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
