# My own dotfiles
## Dependencies for DWM
   #### Arch linux 
    sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig ttf-dejavu ttf-dejavu-ner
   #### Ubuntu
    sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev

## Install
    git clone --recurse-submodules https://github.com/DjejDjej/nvim/dotfiles 
    sudo pacman -S stow
    stow ~/dotfiles
