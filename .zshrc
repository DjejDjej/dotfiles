# Define the HOME_DIR variable
HOME_DIR="$HOME"

autoload -U compinit && compinit -
ZVM_INIT_MODE=sourcing	

# Source initial configurations
source "$HOME_DIR/.zsh_conf/init"
load_modules "kube" "misc" "aliases" "prompt" "jmp"


# Initialize fzf
source ~/dotfiles/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source <(fzf --zsh)

# Source autojump if available
[[ -s "$HOME_DIR/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME_DIR/.autojump/etc/profile.d/autojump.sh"


export TERM=xterm-256color
# Set the default editor variables
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"
export MANPAGER='nvim +Man!'
alias b='gcc *.c -o "$(basename "$PWD")" && ./"$(basename "$PWD")"' 
setopt autocd
export GTK_THEME=Adwaita-dark

