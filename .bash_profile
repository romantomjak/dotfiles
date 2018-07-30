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
