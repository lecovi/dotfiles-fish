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
## Set this to have .venv/ directory inside project
#set -x PIPENV_VENV_IN_PROJECT 1
set -x VAGRANT_DEFAULT_PROVIDER virtualbox
# ANDROID_HOME enviroment variable
#set -x ANDROID_HOME ~/Android/Sdk
#set -x PATH $PATH $ANDROID_HOME/tools $ANDROID_HOME/platform-tools

abbr -a gcam git commit -a -m
abbr -a gcm git commit -m
abbr -a gcl git clone --recursive
abbr -a sdu sudo dnf update
abbr -a sdi sudo dnf install
abbr -a sds sudo dnf search
abbr -a spo sudo poweroff
abbr -a pei pipenv install --three
abbr -a per pipenv run
abbr -a prpm pipenv run python manage.py

#eval (pipenv --completion)
alias vim="nvim"
alias vi="nvim"

bash ~/.config/fish/start_tmux_session.sh

# Kawasaki Theme customization by lecovi
set -g theme_display_rw no
set -g theme_display_time yes
set -g theme_display_group no
set -g theme_color_prompt normal
set -g theme_color_time yellow
set -g theme_color_virtualenv bryellow
set -g theme_color_user FF0000
set -g theme_color_group FF0000
set -g theme_color_host brpurple
set -g theme_color_separator brpurple
set -g __fish_git_prompt_color_branch brgreen
set -g theme_display_time_format '+%H:%M:%S'
set -g theme_prompt_userhost_separator '@'
set -g __fish_git_prompt_char_branch_begin         ''
set -g __fish_git_prompt_char_branch_end           ''
set -g __fish_git_prompt_color_branch_begin        bryellow
set -g __fish_git_prompt_color_branch_end          bryellow
