#!/usr/bin/env bash
shopt -s globstar

updatecfg() {
	rm -v ./bin/*
	rm -v ./etc/*
	cp -v ~/.local/bin/* ./bin/
	cp -v ~/.local/etc/* ./etc/ 
	
	cp -rv ~/.config/openbox     ./config/
	cp -rv ~/.config/lf       ./config/
	cp -rv ~/.config/tint2    ./config/
	#cp -rv ~/.config/dunst    ./config/
	cp -v ~/.config/user-dirs.dirs ./config/

	cp -v ~/.bashrc ./bashrc

	printf "%s\n" "Done!"
}

installcfg() {
	read -rp "WARNING! This may overwrite important files! Continue? (y/n)"
	cp -rv ./bin ~/.local/
	cp -rv ./etc ~/.local/
	
	cp -rv ./config/* ~/.config/

	cp -vi ./bashrc ~/.bashrc
	printf "%s\n" "Done!"
}

case "$1" in
	# install
	[iI]*)
		installcfg
	;;
	*)
		updatecfg
	;;
esac
