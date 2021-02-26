#!/bin/bash
aurman -S --needed $( cat install.txt )
aurman -R $( cat remove.txt )
aurman -Rcsn $( pacman -Qdtq )
