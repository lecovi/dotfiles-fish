# dotfiles-fish
My Fish config

## Installation

1. Run `install.sh`, logout and re-login.
2. Run `omf_fisher.sh`, logout and re-login.
3. Run `customize.sh`, enjoy and have fun!

### Scripts

- `install.sh` will install `fish` for your user and set it as default shell.
    - Your user needs to be `sudoer`
- `omf_fisher.sh` will install **Oh my Fish** and **Fisherman**.
- `customize.sh` will install a couple of plugins, the theme and some aliases.
    - **Git**: adds muliple `git` aliases.
    - **SSH Agent**: automatically starts `ssh-agent` and load your identities.
    - **Kawasaki**: nice and clean theme

*I didn't know how to create the whole thing in one script (because of logout/login) and don't wanna waste more time with it. xD*

### Credits
Check out this [blog post](https://blog.devopscomplete.com/fishing-with-bob-the-fish-2decd3a2f87)

- **Oh my Fish** [omf](https://github.com/oh-my-fish/oh-my-fish)
- [bobthefish](https://github.com/oh-my-fish/theme-bobthefish)
- [git-plugin](https://github.com/jhillyerd/plugin-git)
- [fisherman](https://github.com/fisherman/fisherman/wiki/Espa%C3%B1ol)
- [ssh-agent](https://github.com/virtualxdriver/ssh-agent.fish)
- [Kawasaki](https://github.com/hastinbe/theme-kawasaki)