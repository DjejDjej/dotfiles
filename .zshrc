HOME="/home/grr"
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_conf/init
setxkbmap us_qwertz

ZSH_THEME="robbyrussell"

plugins=(git bd)
load_modules "aliases" "prompt" "jmp"

source <(fzf --zsh)

[[ -s /home/grr/.autojump/etc/profile.d/autojump.sh ]] && source /home/grr/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
zle -N jfzf  # Register the function as a Zsh widget

bindkey '^E' jfzf

