#!/bin/bash 

usermod -a -G wheel dean 	# add dean to wheel group
usermod -g wheel dean	 	# add wheel as primary group
sudo visudo /etc/sudoers/	# add no-password sudo-ing
# -> uncomment line that says %wheel ALL ... NOPASSWD ...

sudo pacman -Syu		# update distro

# change default directories to uncapitalised versions
sudoedit /etc/xdg/user-dirs.defaults 
rm -rf ~/*
mkdir ~/downloads ~/desktop ~/documents

# soft-link dotfiles
git clone https://www.github.com/deanpoulos/dotfiles.git
mv dotfiles configs
ln -s configs/*

# install all bootstrap packages
sudo pacman -Sy $( cat configs/bootstrap-applications )

# add GRUB theme
git clone https://github.com/vinceliuice/grub2-themes.git
sudo grub2-themes/install.sh -b -t tela
rm -rf grub2-themes

sudoedit /etc/default/grub
# -> change GRUB_THEME value to GRUB_THEME="/boot/grub/themes/Vimix/theme.txt"
sudo grub-mkconfig -o /boot/grub/grub.cfg

# remove xfce's wm setup
sudo xfce4-session-settings
# -> change restart style of xfwm4, xfce4-panel, xfdesktop to Never
# -> Save Session
# -> add Application Autostart rule for bspwm

xfce4-settings-manager      # change default fonts
nitrogen                    # change wallpaper
sudo chsh -s /bin/zsh dean  # make zsh default shell
brave                       # update brave theme/startpage
xfce4-settings-manager      # remove keyboard shorcuts

# install zsh plugins
# install polybar-themes fonts

# edit lightdm-greeter-settings

# link sxhkd-help binary
cd /usr/local/bin && sudo ln -s ~/configs/bin/*

# synchronise time with network time
sudo ntpd -qg

# synchronise onedrive
onedrive

# set default cursor
xsetroot -cursor_name left_ptr

# change cursor to adwaita
xfce4-settings-mangaer  # Mouse & Touchpad > Theme

# install brave extensions
brave   # gruvbox theme, google dark-theme, video speed controller
