# vim plugins
git clone https://github.com/vim-airline/vim-airline $HOME/.vim/pack/dist/start/vim-airline
git clone https://github.com/airblade/vim-gitgutter $HOME/.vim/pack/dist/start/vim-gitgutter

# aliases
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/.bash_profile $HOME/.bash_profile
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.gitignore_global $HOME/.gitignore_global
ln -s $PWD/.vimrc $HOME/.vimrc

# virtualenvwrapper
mkdir $HOME/.virtualenvs

# ssh
mkdir $HOME/.ssh
cp .ssh.config.example $HOME/.ssh/config

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install ffmpeg
