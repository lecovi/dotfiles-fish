## Added virtualenv support to your shell
#eval (python -m virtualfish compat_aliases auto_activation)

## Global Export PATH
set -gx PATH $PATH ~/.local/bin /sbin
## If you use virtualenv, you will probably need to disable the default
## virtualenv prompt, since it doesn't play nice with fish:
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
## Setting virtualenv directory
set -x WORKON_HOME ~/.virtualenvs
## Use this version of Python when creating new virtual environments
set -x PIPENV_DEFAULT_PYTHON_VERSION 3
## Always use fancy mode when invoking pipenv shell
#set -x PIPENV_SHELL_FANCY 1
set -x VAGRANT_DEFAULT_PROVIDER virtualbox
# ANDROID_HOME enviroment variable
#set -x ANDROID_HOME ~/Android/Sdk
#set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools

abbr -a gcam git commit -a -m
abbr -a gcl git clone --recursive
abbr -a sdu sudo dnf update
abbr -a sdi sudo dnf install
abbr -a spo sudo poweroff
abbr -a pei pipenv install --three
abbr -a per pipenv run

#eval (pipenv --completion)
