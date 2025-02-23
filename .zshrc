# Define the HOME_DIR variable
HOME_DIR="$HOME"
ZVM_INIT_MODE=sourcing	
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




fzf_tree_ignore() {
  local base_dir
  # Fall back to pwd if not in a git repo
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

  # Build the tree command
  # NOTE: If you want to see hidden files, remove ".*|" from the -I pattern
  local tree_cmd
  tree_cmd="tree -afi --noreport -I '.*|node_modules' \"$base_dir\""

  # If we’re not at the Git root, strip the $base_dir/ prefix from tree output
  if [[ "$PWD" != "$base_dir" ]]; then
    tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""
  fi

  # Run the tree command and pipe to fzf
  # Using process substitution ($(...)) is safer than eval.
  local selected
  selected="$(
    eval "$tree_cmd" \
    | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})'
  )"

  # Bail out if nothing was selected
  [[ -z "$selected" ]] && return

  # Strip surrounding quotes (in case the selection came in quoted)
  selected="${selected#\"}"
  selected="${selected%\"}"

  # If user typed or selected an absolute path, use it directly
  if [[ "$selected" == /* ]]; then
    if [[ -d "$selected" ]]; then
      cd "$selected" || return
    else
      "${EDITOR:-vim}" "$selected"
    fi
  else
    # Otherwise, prepend base_dir
    if [[ -d "$base_dir/$selected" ]]; then
      cd "$base_dir/$selected" || return
    else
      "${EDITOR:-vim}" "$base_dir/$selected"
    fi
  fi
}

# fzf_tree_all: Shows all files (including hidden), but no ignore pattern.
fzf_tree_all() {
  local base_dir
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"

  local tree_cmd
  tree_cmd="tree -afi --noreport \"$base_dir\""

  if [[ "$PWD" != "$base_dir" ]]; then
    tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""
  fi

  local selected
  selected="$(
    eval "$tree_cmd" \
    | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})'
  )"

  [[ -z "$selected" ]] && return

  selected="${selected#\"}"
  selected="${selected%\"}"

  if [[ "$selected" == /* ]]; then
    if [[ -d "$selected" ]]; then
      cd "$selected" || return
    else
      "${EDITOR:-vim}" "$selected"
    fi
  else
    if [[ -d "$base_dir/$selected" ]]; then
      cd "$base_dir/$selected" || return
    else
      "${EDITOR:-vim}" "$base_dir/$selected"
    fi
  fi
}

fzf_tree_ignore() {
  local base_dir tree_cmd selected
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  tree_cmd="tree -afi --noreport -I '.*|node_modules' \"$base_dir\""
  [[ "$PWD" != "$base_dir" ]] && tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""
  selected="$(eval "$tree_cmd" | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})')"
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
  selected="$(eval "$tree_cmd" | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})')"
  [[ -z "$selected" ]] && return
  selected="${selected#\"}"
  selected="${selected%\"}"
  if [[ "$selected" == /* ]]; then
    [[ -d "$selected" ]] && cd "$selected" || "${EDITOR:-vim}" "$selected"
  else
    [[ -d "$base_dir/$selected" ]] && cd "$base_dir/$selected" || "${EDITOR:-vim}" "$base_dir/$selected"
  fi
}

zle -N fzf_tree_ignore
zle -N fzf_tree_all
bindkey '^T' fzf_tree_ignore
bindkey '^F' fzf_tree_all
