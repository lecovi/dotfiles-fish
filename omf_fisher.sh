#!/usr/bin/fish

# BASH COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'

echo -e $YELLOW"Installing Oh-My-Fish"$RESET
curl -L https://get.oh-my.fish > omf.sh
fish omf.sh --noninteractive

echo -e $YELLOW"Installing Fisherman"$RESET
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman

echo -e $BOLD_GREEN"Succesfully installed! Please close this terminal, login again and run 'customize.sh'"$RESET
