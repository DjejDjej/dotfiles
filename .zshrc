
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
setxkbmap us_qwertz


ZSH_THEME="robbyrussell"


plugins=(git)

##Prompt(ps2)
BLUE="%F{39}"  # Closest ANSI 256 color code for #0dcdcd
WHITE="%F{white}"
RESET="%f"
PROMPT='${WHITE}%n${RESET}@${BLUE}%m${RESET}:${WHITE}%~${RESET}$ '
setopt PROMPT_SUBST
##
alias vim=nvim

##Keys
##

##Aliases
    #General aliases
    alias neofetch="fastfetch --localip-show-ipv4 false"
    alias ls='ls --color=auto'
    alias ll="ls -ltra"
    alias grep='grep --color=auto'
    alias vim="sudo nvim"
    alias aider='python -m aider'

    #Folder moving aliases
    alias wm="cd /home/grr/dwm"
    alias Y="cd /mnt/Y"
    alias D="cd /home/grr/Downloads"
    alias prg="cd /home/grr/programming"
    #Other
    alias inst="sudo pacman -Syu"
    alias p="python3"

###Terminal titling.
function set_title() {
    # Count the number of zsh processes, excluding the grep process itself
    TERMINAL_ID=$(($(ps -ef | grep -c "[z]sh") - 1))
    echo -ne "\033]0;Alacritty $TERMINAL_ID\007"
}
precmd_functions+=(set_title)
