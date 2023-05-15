export ZSH="$HOME/.config/zsh/oh-my-zsh"
ZSH_THEME="alanpeabody"
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
autoload -Uz compinit
compinit
plugins=(git archlinux vi-mode)
source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$XDG_CONFIG_HOME/zsh/aliasrc"

#TMOUT=150
#TRAPALRM() { pipes.sh }
#TRAPALRM() { cmatrix -s | lolcat }
