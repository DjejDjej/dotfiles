# Define the HOME_DIR variable
HOME_DIR="$HOME"

autoload -U compinit && compinit -

# Source initial configurations
source "$HOME_DIR/.zsh/misc"

# Initialize fzf
source ~/dotfiles/zsh-vi-mode/zsh-vi-mode.plugin.zsh
source <(fzf --zsh)

export TERM=xterm-256color
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"
export MANPAGER='nvim +Man!'
setopt autocd
export GTK_THEME=Adwaita-dark


#General
    alias neofetch="fastfetch --localip-show-ipv4 false"
    alias ls='ls --color=auto'
    alias ll="ls -ltra"
    alias grep='grep --color=auto'
    alias vim="nvim"
    alias vi="nvim"
    alias v="nvim"
    alias nano="nvim"
    alias docker='sudo docker'
    alias w="cd $HOME/work/"
    alias smi="sudo make install"
    alias smic="sudo make clean install"
    alias b='gcc *.c -o "$(basename "$PWD")" && ./"$(basename "$PWD")"' 
    alias itten="kitten"
    alias icat="itten icat"
#Pacman

    alias inst="sudo pacman -S"
    alias update="sudo pacman -Syu"
    alias remov="sudo pacman -R"
#Git
    alias ga='git add'
    alias gc='git commit -m'
    alias gac='git add .; git commit -m'
    alias g='git'
    alias vo='vim .'
    bindkey '^L' clear-screen

#Kube aliases

    alias ns="kubens"
    alias ctx="kubectx"
    alias oc="k"

source ~/.zsh/kube-ps1.plugin.zsh
source ~/.zsh/kubectl.plugin.zsh
source ~/.zsh/kubectx.plugin.zsh 

export KUBE_PS1_SYMBOL=""         # Remove the Kubernetes symbol
export KUBE_PS1_SEPARATOR=""      # Remove the separator
export KUBE_PS1_PREFIX=""         # Remove the prefix (usually "(")
export KUBE_PS1_SUFFIX=""         # Remove the suffix (usually ")")
export KUBE_PS1_SYMBOL_ENABLE=false 
