#!/usr/bin/fish

# BASH COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'

echo -e $YELLOW"Installing Oh-My-Fish"$RESET
echo curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
echo install
install

echo -e $YELLOW"Installing Fisherman"$RESET
echo curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

echo -e $BOLD_GREEN"Succesfully installed! Please close this terminal, login again and run 'customize.sh'"$RESET
