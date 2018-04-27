# aliases
ln -s $PWD/.bash_aliases $HOME/.bash_aliases
ln -s $PWD/.bash_profile $HOME/.bash_profile
ln -s $PWD/.gitconfig $HOME/.gitconfig
ln -s $PWD/.gitignore_global $HOME/.gitignore_global

# virtualenvwrapper
mkdir $HOME/.virtualenvs

# ssh
mkdir $HOME/.ssh
cp .ssh.config.example $HOME/.ssh/config

# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew install ffmpeg
