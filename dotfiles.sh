#update all dotfiles for user
home=/home/$USER
dotfiles=$home/dotfiles
olddotfiles=$home/olddotfiles
config=$home/.config

homefiles='.vim .scripts .bashrc .Xdefaults .conkyrc .gitconfig .Xmodmap'
conffiles='ranger i3 conkystatus polybar i3blocks qutebrowser mpd cmus openbox syncthing VirtualBox tint2 pulse'
etcfiles='vimrc cron.* NetworkManager profile'

function startscript {
	
	rm -r $olddotfiles			
	mkdir -p $olddotfiles/.config $olddotfiles/etc
	for file in $homefiles; do
		mv $home/$file $olddotfiles
		ln -s $dotfiles/$file $home
	done
	for file in $conffiles; do
		mv $home/.config/$file $olddotfiles/.config
		ln -s $dotfiles/.config/$file $home/.config/$file
	done
	for file in $etcfiles; do 
		mv /etc/$file $olddotfiles/etc/
		ln -s $dotfiles/etc/$file /etc/
	done

}

function initsys {
	
	echo "Moving current dotfiles to $dotfiles"
	mkdir -p $dotfiles/.config $dotfiles/etc
	for file in $homefiles; do
		mv $home/$file $dotfiles
		ln -s $dotfiles/$file $home
	done
	for file in $conffiles; do
		mv $home/.config/$file $dotfiles/.config/
		ln -s $dotfiles/.config/$file $home/.config
	done
	for file in $etcfiles; do
		mv /etc/$file $dotfiles/etc/
		ln -s $dotfiles/etc/$file /etc/
	done
	echo "done"
	exit
}

function rlywnna { 
	echo "Your about to delete the last dotfile Backup and replace your current ones with the newest. Do You want to continue?"
	read -p "y/n	" choice
	case "$choice" in
		n|N ) echo ""no"" ;;
		y|Y ) startscript;;
		init ) initsys;;
		* ) echo ""Please give a valid Response."" && rlywnna;;
	esac
} 
rlywnna
exit
