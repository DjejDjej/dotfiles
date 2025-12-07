# Define the HOME_DIR variable
HOME_DIR="$HOME"
autoload -U compinit && compinit -
ZVM_INIT_MODE=sourcing	# Source initial configurations
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
xinput --set-prop 13 "libinput Accel Speed" -0.8


#General
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
    alias itten="kitten"
    alias icat="itten icat"
#Pacman

    alias inst="sudo pacman -S"
    alias update="sudo pacman -Syu"
    alias remov="sudo pacman -R"
#Git
    alias vo='vim .'
    bindkey '^L' clear-screen

#Kube aliases

    # alias ns="kubens"
    # alias ctx="kubectx"

# source ~/.zsh/kube-ps1.plugin.zsh
# source ~/.zsh/kubectl.plugin.zsh
# source ~/.zsh/kubectx.plugin.zsh 

# export KUBE_PS1_SYMBOL=""         # Remove the Kubernetes symbol
# export KUBE_PS1_SEPARATOR=""      # Remove the separator
# export KUBE_PS1_PREFIX=""         # Remove the prefix (usually "(")
# export KUBE_PS1_SUFFIX=""         # Remove the suffix (usually ")")
# export KUBE_PS1_SYMBOL_ENABLE=false 



fzf_tree_ignore() {
  local base_dir tree_cmd selected action
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  tree_cmd="tree -afi --noreport -I '.*|node_modules' \"$base_dir\""
  [[ "$PWD" != "$base_dir" ]] && tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""

  selected="$(eval "$tree_cmd" | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})')"
  [[ -z "$selected" ]] && return

  selected="${selected#\"}"
  selected="${selected%\"}"

  if [[ "$selected" == /* ]]; then
    if [[ -d "$selected" ]]; then
      action="cd \"$selected\""
    else
      action="${EDITOR:-vim} \"$selected\""
    fi
  else
    if [[ -d "$base_dir/$selected" ]]; then
      action="cd \"$base_dir/$selected\""
    else
      action="${EDITOR:-vim} \"$base_dir/$selected\""
    fi
  fi

  print -s "$action"
  eval "$action"
}

fzf_tree_all() {
  local base_dir tree_cmd selected action
  base_dir="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
  tree_cmd="tree -afi --noreport \"$base_dir\""
  [[ "$PWD" != "$base_dir" ]] && tree_cmd="$tree_cmd | sed \"s|^$base_dir/||\""

  selected="$(eval "$tree_cmd" | fzf --preview '([[ -d {} ]] && tree -C {} || bat --style=numbers --color=always {})')"
  [[ -z "$selected" ]] && return

  selected="${selected#\"}"
  selected="${selected%\"}"

  if [[ "$selected" == /* ]]; then
    if [[ -d "$selected" ]]; then
      action="cd \"$selected\""
    else
      action="${EDITOR:-vim} \"$selected\""
    fi
  else
    if [[ -d "$base_dir/$selected" ]]; then
      action="cd \"$base_dir/$selected\""
    else
      action="${EDITOR:-vim} \"$base_dir/$selected\""
    fi
  fi

  print -s "$action"
  eval "$action"
}

zle -N fzf_tree_ignore
zle -N fzf_tree_all
bindkey '^T' fzf_tree_ignore
bindkey '^F' fzf_tree_all





# ZLE binding for Zsh:
zle -N open_nvim
zle -N search_rg
zle -N fzf_tree_ignore
zle -N fzf_tree_all
bindkey '^F' fzf_tree_ignore
bindkey '^T' fzf_tree_all
bindkey '^E' open_nvim
bindkey '^G' search_rg
