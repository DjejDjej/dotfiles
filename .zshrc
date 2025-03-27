# Define the HOME_DIR variable
HOME_DIR="$HOME"
autoload -U compinit && compinit -
ZVM_INIT_MODE=sourcing	
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
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh

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
    alias lg='lazygit'
    alias vo='vim .'
    bindkey '^L' clear-screen

#Kube aliases

    alias ns="kubens"
    alias ctx="kubectx"

source ~/.zsh/kube-ps1.plugin.zsh
source ~/.zsh/kubectl.plugin.zsh
source ~/.zsh/kubectx.plugin.zsh 

export KUBE_PS1_SYMBOL=""         # Remove the Kubernetes symbol
export KUBE_PS1_SEPARATOR=""      # Remove the separator
export KUBE_PS1_PREFIX=""         # Remove the prefix (usually "(")
export KUBE_PS1_SUFFIX=""         # Remove the suffix (usually ")")
export KUBE_PS1_SYMBOL_ENABLE=false 
fzf_tree_ignore() {
  local base_dir tree_cmd selected
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  tree_cmd="tree -afi --noreport -I '.*|node_modules' \"$base_dir\""
  [[ "$PWD" != "$base_dir" ]] && tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""

  selected="$(
    eval "$tree_cmd" | fzf \
      --height=100% \
      --border=rounded \
      --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})'
  )"

  [[ -z "$selected" ]] && return
  selected="${selected#\"}"
  selected="${selected%\"}"

  if [[ "$selected" == /* ]]; then
    [[ -d "$selected" ]] && cd "$selected" || "${EDITOR:-vim}" "$selected"
  else
    [[ -d "$base_dir/$selected" ]] && cd "$base_dir/$selected" || "${EDITOR:-vim}" "$base_dir/$selected"
  fi
}

fzf_tree_all() {
  local base_dir tree_cmd selected
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  tree_cmd="tree -afi --noreport \"$base_dir\""
  [[ "$PWD" != "$base_dir" ]] && tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""

  selected="$(
    eval "$tree_cmd" | fzf \
      --border=rounded \
      --height=100% \
      --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})'
  )"

  [[ -z "$selected" ]] && return
  selected="${selected#\"}"
  selected="${selected%\"}"

  if [[ "$selected" == /* ]]; then
    [[ -d "$selected" ]] && cd "$selected" || "${EDITOR:-vim}" "$selected"
  else
    [[ -d "$base_dir/$selected" ]] && cd "$base_dir/$selected" || "${EDITOR:-vim}" "$base_dir/$selected"
  fi
}


function open_nvim() {
  # Optionally clear the current command line
  zle reset-prompt
  # Run nvim in the current directory
  nvim .
  # Refresh the prompt when you return
  zle reset-prompt
}

function search_rg() {
  # Prompt the user for a search pattern
  local pattern
  print -n "Enter search pattern: "
  read pattern
  # Clear the screen (optional)
  clear
  # Run ripgrep with the entered pattern
  rg "$pattern"
  # Optionally wait for input before returning to the shell
  print "Press Enter to continue..."
  read
  zle reset-prompt
}


function pkill() {
  ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -p sudo kill
}

# ZLE binding for Zsh:
zle -N open_nvim
zle -N search_rg
zle -N fzf_tree_ignore
zle -N fzf_tree_all
bindkey '^F' fzf_tree_ignore
bindkey '^T' fzf_tree_all
bindkey '^E' open_nvim
bindkey '^G' search_rg
