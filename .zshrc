# Add ruby to path
export PATH=/home/dean/.local/share/gem/ruby/2.7.0/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/dean/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="red-life"
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

alias ii='$(fc -ln -1)'
alias fetch='clear; neofetch --disable gpu > ~/.fetch_output; cat ~/.fetch_output'
alias logout='kill -9 -1'
alias swipl='swi-prolog.swipl'
alias pacman='sudo pacman'
alias svim='sudo -E vim'
alias prolog='swipl'
alias xprop='xprop | grep CLASS'

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
        if [ $1 = wm ]; then 
            if [ $2 ]; then 
                if [ $2 = tiler ]; then vim ~/.config/bspwm/tile_kitty
                elif [ $2 = subscriber ]; then vim ~/.config/bspwm/subscriber
                else; echo "Syntax error: cf wm [tiler]"; fi
            else; vim ~/.config/bspwm/bspwmrc; fi
        elif [ $1 = start ]; then vim ~/.config/bspwm/startup.sh
        elif [ $1 = colours ]; then vim ~/.config/bspwm/colours.sh
        elif [ $1 = keys ]; then vim ~/.config/sxhkd/sxhkdrc
        elif [ $1 = comp ]; then vim ~/.config/picom/picom.conf
        elif [ $1 = zsh ]; then
            if [ $2 ]; then
                if [ $2 = theme ]; then vim ~/.zsh_theme
                else; echo "Syntax error: cf zsh [theme]"; fi
            else; vim ~/.zshrc && zsh; fi
        elif [ $1 = email ]; then vim ~/.config/mutt/muttrc
        elif [ $1 = zshenv ]; then vim ~/.zshenv
        elif [ $1 = vim ]; then vim ~/.vimrc
        elif [ $1 = kitty ]; then vim ~/.config/kitty/kitty.conf
        elif [ $1 = bar ]; then vim ~/.config/polybar/panels/config.ini
        elif [ $1 = mime ]; then vim ~/.config/mimeapps.list
        elif [ $1 = fetch ]; then vim ~/.config/neofetch/config.conf
        elif [ $1 = fstab ]; then sudoedit /etc/fstab
        elif [ $1 = install ]; then vim ~/configs/bootstrap/install.txt
        elif [ $1 = guide ]; then vim ~/configs/bootstrap/guide.sh
        elif [ $1 = notes ]; then 
            if [ $2 ]; then
                if [ $2 = md ]; then vim ~/configs/.config/joplin-desktop/userstyle.css
                elif [ $2 = app ]; then vim ~/configs/.config/joplin-desktop/userchrome.css
                else; echo "Syntax error: cf notes [md | app]"
                fi
            else; echo "Syntax error: cf notes [md | app]"
            fi
        elif [ $1 = rss ]; then vim ~/.config/newsboat/config
        elif [ $1 = gestures ]; then vim ~/configs/.config/libinput-gestures.conf
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
        if [ $1 = wm ]; then pkill subscriber; pkill tile_kitty; ~/.config/bspwm/bspwmrc
        elif [ $1 = start ]; then sh ~/.config/bspwm/startup.sh
        elif [ $1 = colours ]; then ~/.config/bspwm/colours.sh
        elif [ $1 = keys ]; then pkill -usr1 -x sxhkd; notify-send 'sxhkd' 'Reloaded config'
        elif [ $1 = comp ]; then pkill picom || sleep 1 && nohup picom --experimental-backends --backend glx --xrender-sync-fence >> /dev/null & 
        elif [ $1 = zsh ]; then zsh
        elif [ $1 = bar ]; then ~/.config/polybar/launch.sh --panels
        elif [ $1 = fetch ]; then neofetch
        elif [ $1 = gestures ]; then libinput-gestures-setup stop && libinput-gestures-setup start
        else echo "Syntax error: No refresh sequence configured for argument '$1'."
        fi
    else
        echo "Not enough arguments provided.\nSyntax: fresh <shortcut>"
    fi
}

font()
{
    if [ $1 = "-i" ]; then
        if [ $2 ]; then
            cp $2 /home/dean/.local/share/fonts/
        else
            echo "Usage: font -i <font-name.*tf>"
        fi
    elif [ $1 = "-u" ]; then
        fc-cache -f -v
    else
        echo "Usage: font -i <font-name.*tf>"
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

vlab()
{
    sshfs -o allow_other,reconnect z5122508@cse.unsw.edu.au:/import/kamen/2/z5122508 /home/dean/vlab
}

sync()
{
    OTHER_NODE=$(nmap -p 22 -oG - 192.168.0.0/24 | grep open | grep -v $(ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | grep -v 127) | awk '{print $2}')
    if [ $1 = pull ]; then
        rsync -anv --exclude env --delete $OTHER_NODE:~/unsw ~/
        echo -n "\nDo you wish to commit to these changes (y/n)? "
        while true; do
            read answer
            if [ "$answer" != "${answer#[Yy]}" ]; then
                rsync -av --exclude env --delete $OTHER_NODE:~/unsw ~/
                echo "\nDone!"
                break
            elif [ "$answer" != "${answer#[Nn]}" ]; then
                echo "No changes committed."
                break
            else
                echo "Please answer yes or no."
            fi
        done
    elif [ $1 = push ]; then
        rsync -anv --exclude env --delete ~/unsw $OTHER_NODE:~/
        echo -n "\nDo you wish to push to these changes (y/n)? "
        while true; do
            read answer
            if [ "$answer" != "${answer#[Yy]}" ]; then
                rsync -av --exclude env --delete ~/unsw $OTHER_NODE:~/
                echo "\nDone!"
                break
            elif [ "$answer" != "${answer#[Nn]}" ]; then
                echo "No changes pushed."
                break
            else
                echo "Please answer yes or no."
            fi
        done
    else
        echo "Usage: sync [pull|push]"
    fi
}

DISABLE_UPDATE_PROMPT="true"

# Print "motd"

clear
cat ~/.fetch_output

# To differentiate aliases from other command types
ZSH_HIGHLIGHT_STYLES[alias]='fg=97,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=97,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=97'
ZSH_HIGHLIGHT_STYLES[command]='fg=97'
ZSH_HIGHLIGHT_STYLES[comment]='fg=8'
ZSH_HIGHLIGHT_STYLES[globbing]='none'

LS_COLORS=$LS_COLORS:'ln=0;95:' ; export LS_COLORS
LS_COLORS=$LS_COLORS:'di=0;96:' ; export LS_COLORS
