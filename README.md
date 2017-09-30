# dotfiles-fish
My Fish config

## Steps
Check out this [blog post](https://blog.devopscomplete.com/fishing-with-bob-the-fish-2decd3a2f87)

- instalar fish
- instalar omf
- instalar bobthefish con omf
- `set -g theme_color_scheme solarized-dark`
- instalar el plugin de git con omf
- instalar fisherman
- `fisher install virtualxdriver/ssh-agent.fish.git`
- `pip install virtualfish --user`
- Agregar: `eval (python -m virtualfish compat_aliases auto_activation)` a `~/.config/fish/config.fish`
- `wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraMono.zip`
- `fc-cache -fv`
- `set -U theme_nerd_fonts yes`
- `abbr -a gcam git commit -a -m`
- `set -U VAGRANT_DEFAULT_PROVIDER virtualbox # Only for Fedora`
