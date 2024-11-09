# This repository contains:

### Configs of Suckless Software        
- Slock -- Minimalistic Lockscreen      23Kb
- Dmenu -- Minimalistic App launche     43Kb
- dwm   -- Dynamic Window Manager       62Kb
- barM  -- Custom light Statusbar       15Kb

### Suckless dependencies
#### Arch linux 
-    sudo pacman -S base-devel libx11 libxft libxinerama freetype2 fontconfig ttf-dejavu ttf-dejavu-ner

#### Deb based 
-    sudo apt install build-essential libx11-dev libxft-dev libxinerama-dev libfreetype6-dev libfontconfig1-dev


### ZSH Config
- Modular
- FZF support
- Autojump shortcut
- Without oh my zsh
- Lighweight and smart Kubernetes, Git prompt 
- VI mode

### Kitty config
- Bind for Ctrl+G scrollback with vim motions (tmux copy mode without tmux)
- Deleted unneseary functions

### Other
- Custom keyboard layout us-qwertz
- Picom config
- .xinitrc
- Nice wallpaper
- Change layout script

## Screenshots
 ![Screenshot](https://raw.githubusercontent.com/DjejDjej/dotfiles/refs/heads/main/images/terminals.png)
 ![Screenshot](https://raw.githubusercontent.com/DjejDjej/dotfiles/refs/heads/main/images/vim.png)
 ![Screenshot](https://raw.githubusercontent.com/DjejDjej/dotfiles/refs/heads/main/images/vimopen.png)

## Install
   1. git clone --recurse-submodules https://github.com/DjejDjej/nvim/dotfiles 
   2. sudo pacman -S stow
   3. stow ~/dotfiles
    
## Software
   - zsh
   - stow
   - neovim
   - fzf
   - kitty
   - picom
   - fastfetch
