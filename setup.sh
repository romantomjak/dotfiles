# vim plugins
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/pack/dist/start/vim-airline
git clone https://github.com/airblade/vim-gitgutter $HOME/.vim/pack/dist/start/vim-gitgutter
git clone https://github.com/scrooloose/nerdtree.git $HOME/.vim/pack/dist/start/nerdtree
git clone https://github.com/junegunn/fzf.vim $HOME/.vim/pack/dist/start/fzf.vim
git clone https://github.com/nvie/vim-flake8 $HOME/.vim/pack/dist/start/vim-flake8

# aliases
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/.bash_functions $HOME/.bash_functions
ln -s $PWD/.bash_autocomplete $HOME/.bash_autocomplete
ln -s $PWD/.bash_profile $HOME/.bash_profile
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.vimrc $HOME/.vimrc
ln -s $PWD/.sublime-settings "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

# virtualenvwrapper
mkdir $HOME/.virtualenvs

# ssh config
[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -f $HOME/.ssh/config ] || cp .ssh.config.example $HOME/.ssh/config

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget ffmpeg nmap fzf ripgrep tmux hugo postgresql kubernetes-cli wrk telnet

# pip
pip3 install requests flake8 ansible passlib
