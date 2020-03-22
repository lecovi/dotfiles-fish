# dotfiles-fish
My Fish config

## Steps
Check out this [blog post](https://blog.devopscomplete.com/fishing-with-bob-the-fish-2decd3a2f87)

- Install `fish`:

```
sudo dnf install fish
chsh -s /usr/bin/fish
```
- Install **Oh my Fish** [omf](https://github.com/oh-my-fish/oh-my-fish)

```
curl -L https://get.oh-my.fish | fish
```

- Install [bobthefish(https://github.com/oh-my-fish/theme-bobthefish)] con `omf`

```
omf install bobthefish
```

- Set solarized dark theme:
```
set -g theme_color_scheme solarized-dark
```

- Install [git-plugin](https://github.com/jhillyerd/plugin-git) con `omf`:

```
omf install https://github.com/jhillyerd/plugin-git
```

- Install [fisherman](https://github.com/fisherman/fisherman/wiki/Espa%C3%B1ol)

```
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
```

- Install [ssh-agent](https://github.com/virtualxdriver/ssh-agent.fish)

```
fisher install virtualxdriver/ssh-agent.fish.git
```

- Install **FiraMono** from [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts)

```
mkdir -p ~/.fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.1.0/FiraMono.zip
unzip FiraMono.zip
mv *.otf ~/.fonts
fc-cache -fv
```
- Activate nerd fonts:
```
set -U theme_nerd_fonts yes

```
- Copy `config.fish` to `~/.config/fish/`

```
cp config.fish ~/.config/fish/
```