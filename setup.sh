# zsh plugins
[ -d $HOME/.zsh ] || mkdir $HOME/.zsh
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.zsh/zsh-autosuggestions

# vim plugins
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/pack/dist/start/vim-airline
git clone https://github.com/airblade/vim-gitgutter $HOME/.vim/pack/dist/start/vim-gitgutter
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/pack/dist/start/nerdtree
git clone https://github.com/junegunn/fzf.vim $HOME/.vim/pack/dist/start/fzf.vim
git clone https://github.com/nvie/vim-flake8 $HOME/.vim/pack/dist/start/vim-flake8
git clone https://github.com/fatih/vim-go.git $HOME/.vim/pack/dist/start/vim-go

# configuration file aliases
ln -s $PWD/.zsh_aliases $HOME/.zsh_aliases
ln -s $PWD/.zsh_functions $HOME/.zsh_functions
ln -s $PWD/.zsh_autocomplete $HOME/.zsh_autocomplete
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.screenrc $HOME/.screenrc
ln -s $PWD/gpg.conf $HOME/.gnupg/gpg.conf

# editor configuration
# copy configuration instead of symlinking. editors like to reorganize it, so
# it often appears as changed when in fact it hasn't
cp $PWD/sublime-settings "$HOME/Library/Application Support/Sublime Text/Packages/User/Preferences.sublime-settings"
cp $PWD/vs-code-settings "$HOME/Library/Application Support/Code/User/settings.json"
cp $PWD/vs-code-key-bindings "$HOME/Library/Application Support/Code/User/keybindings.json"

# how to install vscode extensions automatically?
# github plus theme, gitlens, go, material theme icons, python, terminal

# virtualenvwrapper
mkdir $HOME/.virtualenvs

# ssh config
[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -f $HOME/.ssh/config ] || cp .ssh.config.example $HOME/.ssh/config

# brew
brew install wget ffmpeg nmap fzf ripgrep tmux hugo postgresql kubernetes-cli wrk telnet dive coreutils

# pip
# using --user tells pip to work on current user's local python package install
# location, rather than the system-wide one. this makes packages go into
# ~/Library/Python/<version>/lib/python/site-packages. it also means that $PATH
# needs to include ~/Library/Python/<version>/bin
pip3 install --user requests flake8 ansible passlib virtualenv virtualenvwrapper
