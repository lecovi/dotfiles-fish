#!/usr/bin/fish

# BASH COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'

echo -e $YELLOW"Installing git-plugin with OMF"$RESET
omf install https://github.com/jhillyerd/plugin-git

echo -e $YELLOW"Installing ssh-agent plugin with Fisherman"$RESET
fisher install virtualxdriver/ssh-agent.fish.git

echo -e $YELLOW"Linking config file"$RESET
if test -e $HOME/.config/fish/config.fish
    echo -e $BOLD_RED"Already exists config.fish, please check!"$RESET
    exit 1
else
    ln -s $PWD/config.fish $HOME/.config/fish/config.fish
end

echo -e $YELLOW"Installing Kawasaki theme with OMF"$RESET
omf install kawasaki
omf theme kawasaki

echo -e $YELLOW"Creating config.fish from template"$RESET
cp config.fish.base config.fish

if test -d $HOME/Android/Sdk
    echo '''###############################################################################
# ANDROID
###############################################################################
set -x ANDROID_HOME ~/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools
''' >> config.fish
    echo -e $YELLOW"Seted ANDROID_HOME and PATH updated"$RESET
else
    echo -e $YELLOW"No Android SDK detected"$RESET
end

if test -d $HOME/.pyenv
    echo '''###############################################################################
## PYENV
###############################################################################
set -x PATH ~/.pyenv/bin $PATH
pyenv init - | source
pyenv virtualenv-init - | source
''' >> config.fish
    echo -e $YELLOW"Pyenv initialized and PATH updated"$RESET
else
    echo -e $YELLOW"No pyenv detected"$RESET
end

cat /etc/os-release | grep "^ID=" | read --array --delimiter = --local DISTRO
switch $DISTRO[2]
case fedora
    echo '''###############################################################################
### DNF
###############################################################################
abbr -a sdu sudo dnf update
abbr -a sdi sudo dnf install
abbr -a sds sudo dnf search
''' >> config.fish
    echo -e $YELLOW"DNF aliases"$RESET
case debian
    echo '''###############################################################################
### DNF
###############################################################################
abbr -a sau sudo apt update
abbr -a sai sudo apt install
abbr -a sas sudo apt search
''' >> config.fish
    echo -e $YELLOW"APT aliases"$RESET
case manjaro
    echo -e $YELLOW"You are using Manjaro, no need for package manager aliases"$RESET
case '*'
    echo -e $RED"Unsupported GNU/Linux"$RESET
end

which nvim
if test $status -eq 0
    echo '''###############################################################################
## NEOVIM
###############################################################################
#eval (pipenv --completion)
alias vim="nvim"
alias vi="nvim"
''' >> config.fish
    echo -e $YELLOW"NeoVim aliases"$RESET
else
    echo -e $RED"NeoVim not installed! WTF!?"$RESET
end

echo -e $BOLD_GREEN"Finished! Please logout and re-login"$RESET