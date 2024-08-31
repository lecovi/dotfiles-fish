# dotfiles-fish

My personal [fish](https://fishshell.com/) configuration

## Installation

1. Run `install.sh`, logout and re-login. 🤷🏽‍♂️
2. Run `omf_fisher.sh`, logout and re-login. 🤷🏽‍♂️
3. Run `customize.sh`, enjoy and have fun! 🎉

### Scripts

- `install.sh` will install `fish` for you and set it as default shell.
    - 💻 This script will detect you "*nix" system and install fish with the proper command.
    - 🦸🏽‍♂️ Your user needs to be `sudoer`
    - **NOTE:** Currently works for `macOS`, `Debian 9`, `fedora`, `manjaro` and `arch` based systems.
- `omf_fisher.sh` will install **Oh my Fish** and **Fisherman**.
    - **Oh my Fish**: is a framework for managing your fish shell configuration inspired by the likes of zsh and oh-my-zsh.
    - **Fisherman**: is a plugin manager for fish, inspired by Vundle.
- `customize.sh` will install my selected plugins, the theme and configure some aliases.
    - **Git**: adds muliple `git` aliases.
    - **SSH Agent**: automatically starts `ssh-agent` and load your identities.
    - **Kawasaki**: nice and clean theme
    - This script will backup your current `fish` configuration and replace it with mine.

*I didn't know how to create the whole thing in one script (because of logout/login) and don't wanna waste more time with it. xD*

### Credits
Check out this [blog post](https://blog.devopscomplete.com/fishing-with-bob-the-fish-2decd3a2f87)

- **Oh my Fish:** [omf](https://github.com/oh-my-fish/oh-my-fish)
- [fisherman](https://github.com/fisherman/fisherman/wiki/Espa%C3%B1ol)
- [git-plugin](https://github.com/jhillyerd/plugin-git)
- [ssh-agent](https://github.com/virtualxdriver/ssh-agent.fish)
- [Kawasaki](https://github.com/hastinbe/theme-kawasaki)
