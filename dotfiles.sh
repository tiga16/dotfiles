#update all dotfiles for user
home=/home/$USER
dotfiles=$home/dotfiles
olddotfiles=$home/olddotfiles
config=$home/.config

homefiles='.vim .scripts .bashrc .Xdefaults .conkyrc .gitconfig .Xmodmap .shortcuts'
conffiles='ranger i3 conkystatus polybar i3blocks qutebrowser mpd cmus openbox syncthing VirtualBox tint2'
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
	v=$(cat version)
	v=$(($v+1))
	echo $v>version

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

function addf {
read -p "1-$homefiles 2-$conffiles 3-$etcfiles " path
read -p "what is the name of the file " file
case $path in
	1 ) mv $home/$file $dotfiles && ln -s $dotfiles/$file $home/;;
	2 ) mv $home/.config/$file $dotfiles/.config && ln -s $dotfiles/.config/$file $home/.config/;;
	3 ) mv /etc/$file $dotfiles/etc/ && ln -s $dotfiles/etc/$file /etc/;;
	* ) echo "please give a valid response" && addfile;;
esac
}

 function addfile {
	 read -p "Please add the file to the Script. Done?" choice
	 case "$choice" in
		 n|N ) exit;;
		 y|Y ) addf;;  
	 esac
 }

function sync {
	git pull origin master
	commit=$(echo version)
	git commit -m $commit
	git push origin master
}

function rlywnna { 
	echo "Your about to delete the last dotfile Backup and replace your current ones with the newest. Do You want to continue?"
	read -p "y/n	" choice
	case "$choice" in
		n|N ) echo ""no"" ;;
		y|Y ) startscript;;
		init ) initsys;;
		add ) addfile;;
		* ) echo ""Please give a valid Response."" && rlywnna;;
	esac
} 
rlywnna
exit
