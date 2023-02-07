#!/usr/bin/env fish

# BASH COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'
set BOLD_WHITE '\e[1;37m'

echo -e $BOLD_WHITE"This will install and config your fish shell:"$RESET
echo -e $BOLD_WHITE"  - git-plugin with Fisherman"$RESET
echo -e $BOLD_WHITE"  - ssh-agent with Fisherman"$RESET
echo -e $BOLD_WHITE"  - copy config.fish from config.fish.base"$RESET
echo -e $BOLD_WHITE"  - Kawasaki theme for OMF"$RESET
echo -e $BOLD_WHITE"  - Android SDK variables"$RESET
echo -e $BOLD_WHITE"  - Pyenv init"$RESET
echo -e $BOLD_WHITE"  - Abrevations for GNU/Linux package managers (DNF|APT)"$RESET
echo -e $BOLD_WHITE"  - NeoVim abbreviations"$RESET
echo -e $BOLD_WHITE""$RESET
echo -e $BOLD_WHITE""$RESET
echo -e $BOLD_WHITE"========================================================"$RESET


set -l _FISHER_PLUGINS (fisher list | string split0)
set -l _FISHER_PLUGIN_LIST (string split \n $_FISHER_PLUGINS)
set -l GIT_PLUGIN jhillyerd/plugin-git
set -l SSH_AGENT_PLUGIN danhper/fish-ssh-agent
set -l _OMF_THEMES (omf theme | string split0)
set -l _OMF_THEMES_LIST (string split \n $_OMF_THEMES --no-empty)
set -l _OMF_DEFAULT_THEME_LINE (string split \t $_OMF_THEMES_LIST[2] --no-empty)
set -l OMF_THEME kawasaki
set -l OMF_DEFAULT_THEME (string match -r $OMF_THEME $_OMF_DEFAULT_THEME_LINE[2])


## git-plugin with Fisherman
if contains $GIT_PLUGIN $_FISHER_PLUGIN_LIST;
    echo -e $RED"git-plugin: $GIT_PLUGIN already installed"$RESET
else
    echo echo -e $YELLOW"Installing $GIT_PLUGIN with Fisherman"$RESET
    fisher install $GIT_PLUGIN
end


## ssh-agent with Fisherman
if contains $SSH_AGENT_PLUGIN $_FISHER_PLUGIN_LIST;\
    echo -e $RED"ssh-agent: $SSH_AGENT_PLUGIN already installed"$RESET
else
    echo -e $YELLOW"Installing $SSH_AGENT_PLUGIN plugin with Fisherman"$RESET
    fisher install $SSH_AGENT_PLUGIN
    # SSH agent needs to start at least once
    set -l lifetime
    echo "Starting ssh-agent..."
    source (/usr/bin/env ssh-agent -s $lifetime | sed 's/\([^=]*\)=\([^;]*\);.*/set -xU \1 \2/' | psub)
end


## Creating config.fish configuration file
if test -L $HOME/.config/fish/config.fish
    echo -e $RED"config.fish: already linked"$RESET
else 
    if test -e $HOME/.config/fish/config.fish
        echo -e $YELLOW"Already exists config.fish, creating a backup!"$RESET
        mv $HOME/.config/fish/config.fish $PWD/config.fish.bak
    end
    
    echo -e $YELLOW"Creating config.fish from template"$RESET
    cp config.fish.base config.fish
    
    echo -e $YELLOW"Linking config file"$RESET
    ln -s $PWD/config.fish $HOME/.config/fish/config.fish

    if test -e $PWD/config.fish.bak
        echo -e $BOLD_GREEN"Adding config.fish.bak to current config.fish"$RESET
        cat $PWD/config.fish.bak >> config.fish
    end
end


## Kawasaki theme for OMF
if  contains $OMF_THEME $OMF_DEFAULT_THEME
    echo -e $RED"OMG Theme: $OMF_THEME Already installed"$RESET
else
    echo -e $YELLOW"Installing $OMF_THEME theme with OMF"$RESET
    omf install $OMF_THEME
    omf theme $OMF_THEME
end


## Android SDK variables
if test -d $HOME/Android/Sdk
    echo '''###############################################################################
# ANDROID
###############################################################################
set -x ANDROID_HOME ~/Android/Sdk
set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools
''' >> config.fish
    echo -e $YELLOW"Updated config.fish with ANDROID_HOME and PATH variables for Android support"$RESET
else
    echo -e $YELLOW"Android: No Android SDK detected"$RESET
end

## Pyenv
if type -q pyenv
    set -Ux PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    echo '''
###############################################################################
## PYENV
###############################################################################
pyenv init - | source
pyenv virtualenv-init - | source
''' >> config.fish
    echo -e $YELLOW"Updated config.fish with Pyenv initialization and PATH var"$RESET
else
    echo -e $YELLOW"No pyenv detected"$RESET
end

## Abbreviations for GNU/Linux package managers
switch (uname)
    case Linux
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
            ase debian
                echo '''###############################################################################
### APT
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
    case Darwin
            echo You are using MacOS, use brew!
    case FreeBSD NetBSD DragonFly
            echo Hi Beastie!
    case '*'
            echo Hi, stranger!
end

## NeoVim abbreviations
if which nvim;
    echo '''###############################################################################
## NEOVIM
###############################################################################
alias vim="nvim"
alias vi="nvim"
''' >> config.fish
    echo -e $YELLOW"NeoVim aliases"$RESET
else
    echo -e $RED"NeoVim not installed! WTF!?"$RESET
end

echo -e $BOLD_GREEN"Finished! Please logout and re-login"$RESET
echo -e $BOLD_GREEN"If you wanna change config, please update the config.fish in this directory"$RESET
echo -e $BOLD_GREEN"Restart your shell with 'exec "$SHELL"'"$RESET
