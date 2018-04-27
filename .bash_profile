# brew apps go first
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# virtualenvwrapper
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    VIRTUALENVWRAPPER_PYTHON=/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
    WORKON_HOME=$HOME/.virtualenvs
    source /usr/local/bin/virtualenvwrapper.sh
fi

# ruby gems
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

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

# preferred editor
export EDITOR='vim'

# load other dotfiles
source .bash_aliases
