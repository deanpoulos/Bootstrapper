usermod -a -G wheel dean 	# add dean to wheel group
usermod -g wheel dean	 	# add wheel as primary group
sudo visudo /etc/sudoers/	# add no-password sudo-ing
# -> uncomment line that says %wheel ALL ... NOPASSWD ...

sudo pacman -Syu		# update distro

# change default directories to uncapitalised versions
sudo vim /etc/xdg/user-dirs.defaults 
rm -rf ~/*
mkdir ~/downloads ~/desktop

# soft-link dotfiles
git clone https://www.github.com/deanpoulos/dotfiles.git
mv dotfiles configs
ln -s configs/*

# install all bootstrap packages
sudo pacman -Sy $( cat configs/bootstrap-applications )

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
cd /usr/local/bin && sudo ln -s ~/configs/bin/sxhkd-help

# synchronise time with network time
sudo ntpd -qg

# synchronise
pacaur -S onedrive-git  # github.com/skillion/onedrive
onedrive

# set default cursor
xsetroot -cursor_name left_ptr
