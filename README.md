# My own dotfiles
# This repository contains:

### Configs of Suckless Software        Size
- Slock -- Minimalistic Lockscreen      23K
- Dmenu -- Minimalistic App launche     43K
- dwm   -- Dynamic Window Manager       62K
                                       128K 

### ZSH Config
- modular
- fzf support
- autojump shortcut
- no oh my zsh
- lighweight and smart Kubernetes, Git prompt 
- VI mode

### Kitty config
- Bind for Ctrl+G scrollback with vim motions (tmux copy mode without tmux)
- Deleted unneseary functions

### Other
- Custom keyboard layout us-qwertz
- Picom config
- .xinitrc
- Nice wallpaper

## Suckless dependencies
   #### Arch linux 
    sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig ttf-dejavu ttf-dejavu-ner
   #### Deb based 
    sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev

## Install
   - git clone --recurse-submodules https://github.com/DjejDjej/nvim/dotfiles 
   - sudo pacman -S stow
   - stow ~/dotfiles
## Software
   - zsh
   - stow
   - neovim
   - fzf
   - kitty
   - picom

