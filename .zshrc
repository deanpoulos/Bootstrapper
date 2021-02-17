# Print "motd"
clear
DISPLAY="" neofetch --disable gpu

# Add ruby to path
export PATH=/home/dean/.local/share/gem/ruby/2.7.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dean/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="half-life"
ZSH_THEME_RANDOM_CANDIDATES=(
    "agnoster"
	"half-life"
	"jnrowe"
	"jonathan"
	"jreese"
	"linuxonly"
	"sonicradish"
	"trapd00r"
)

CASE_SENSITIVE="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

# Add sudo !! feature
alias ii='$(fc -ln -1)'
alias logout='kill -9 -1'
alias swipl='swi-prolog.swipl'
alias pacman='sudo pacman'
alias svim='sudo -E vim'

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

cf () 
{
    if [ $1 ]
    then 
        if [ $1 = bspwm ]; then vim ~/.config/bspwm/bspwmrc
        elif [ $1 = start ]; then vim ~/.config/bspwm/startup.sh
        elif [ $1 = colours ]; then vim ~/.config/bspwm/colours.sh
        elif [ $1 = keys ]; then vim ~/.config/sxhkd/sxhkdrc
        elif [ $1 = picom ]; then vim ~/.config/picom/picom.conf
        elif [ $1 = zsh ]; then vim ~/.zshrc
        elif [ $1 = mutt ]; then vim ~/.config/mutt/muttrc
        elif [ $1 = zshenv ]; then vim ~/.zshenv
        elif [ $1 = vim ]; then vim ~/.vimrc
        elif [ $1 = kitty ]; then vim ~/.config/kitty/kitty.conf
        else echo "Syntax error: No dotfile configured for argument '$1'."
        fi
    else 
        echo "Not enough arguments provided.\nSyntax: cf <shortcut>"
    fi
}

fresh () 
{
    if [ $1 ] 
    then
        if [ $1 = bspwm ]; then ~/.config/bspwm/bspwmrc
        elif [ $1 = start ]; then sh ~/.config/bspwm/startup.sh
        elif [ $1 = colours ]; then ~/.config/bspwm/colours.sh
        elif [ $1 = keys ]; then pkill -usr1 -x sxhkd; notify-send 'sxhkd' 'Reloaded config'
        elif [ $1 = picom ]; then killall picom || sleep 1 && picom &
        elif [ $1 = zsh ]; then zsh
        else echo "Syntax error: No refresh sequence configured for argument '$1'."
        fi
    else
        echo "Not enough arguments provided.\nSyntax: fresh <shortcut>"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

DISABLE_UPDATE_PROMPT="true"
