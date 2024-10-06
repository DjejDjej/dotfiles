# Define the HOME_DIR variable
HOME_DIR="$HOME"

autoload -U compinit && compinit -u
# Source initial configurations
source "$HOME_DIR/.zsh_conf/init"
load_modules "kube" "misc" "aliases" "prompt" "jmp"


# Initialize fzf
source <(fzf --zsh)

# Source autojump if available
[[ -s "$HOME_DIR/.autojump/etc/profile.d/autojump.sh" ]] && source "$HOME_DIR/.autojump/etc/profile.d/autojump.sh"


# Set the default editor variables
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"


function update_dotfiles() {
         "$HOME_DIR/.zsh_conf/tools/update.sh"  
}

setopt autocd
