################################################################################
#                               startup.sh                                     #
#          A rice-worthy workspace configuration for start-up glory.           # 
################################################################################

sleep 3             # initial delay ( for timing / determinism )

# Workspace 3
bspc desktop -f ^3  # secondary monitor
sleep 1

spotify &           # music-client
sleep 5

# Workspace 2
#bspc desktop -f ^2  # secondary monitor
#firefox &
#sleep 0.2 # web-browser

#bspc desktop -f ^5  # secondary monitor
#todoist &
#sleep 1.2

# Workspace 1
bspc desktop -f ^1
sleep 0.2 

kitty spt &
sleep 0.2 

kitty ~/projects/tarot/scripts/run.sh &
sleep 0.2 

kitty ~/scripts/colours/pipes &
sleep 1.2

# main monitor
bspc desktop -f ^4
sleep 0.2 
kitty neomutt &     
sleep 0.2 
feh ~/pictures/jung.jpg &
sleep 0.2 
kitty &
