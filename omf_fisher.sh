#!/usr/bin/env fish

# TERMINAL COLORS
set RESET '\e[0m'
set RED '\e[31m'
set GREEN '\e[32m'
set YELLOW '\e[33m'
set BOLD_RED '\e[1;31m'
set BOLD_GREEN '\e[1;32m'
set BOLD_YELLOW '\e[1;33m'

set INSTALL_OHMYFISH_CMD "curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install && fish install"
set INSTALL_FISHERMAN_CMD "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"


set CHECK_FISHERMAN_VERSION fisher -v
# If you wanna remove fisherman run this command: fisher remove jorgebucaran/fisher
if $CHECK_FISHERMAN_VERSION;
    echo -e $BOLD_YELLOW"Fisher is already installed"$RESET
else
    echo -e $YELLOW"Installing Fisherman"$RESET
    echo -e $BOLD_GREEN Running $INSTALL_FISHERMAN_CMD$RESET
    eval $INSTALL_FISHERMAN_CMD
end


# OH MY FISH REPO: https://github.com/oh-my-fish/oh-my-fish
set CHECK_OMF_VERSION omf version
# If you wanna remove oh-my-fish run this commands:
#   curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
#   fish install --uninstall
if $CHECK_OMF_VERSION;
    echo -e $BOLD_YELLOW"OMF is already installed"$RESET
else
    echo -e $YELLOW"Installing Oh-My-Fish"$RESET
    echo -e $BOLD_GREEN Running $INSTALL_OHMYFISH_CMD$RESET
    eval $INSTALL_OHMYFISH_CMD
end

echo -e $BOLD_GREEN"Succesfully installed! Please close this terminal, login again and run 'customize.sh'"$RESET
