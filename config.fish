eval (python -m virtualfish compat_aliases auto_activation)

set -gx PATH $PATH ~/.local/bin
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x WORKON_HOME ~/.virtualenvs

abbr -a gcam git commit -a -m
abbr -a gcl git clone --recursive
abbr -a sdu sudo dnf update
abbr -a sdi sudo dnf install
abbr -a spo sudo poweroff
abbr -a pei pipenv install --three
abbr -a per pipenv run

#eval (pipenv --completion)
