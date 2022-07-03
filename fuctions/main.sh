 
## Define variable
current_dir=$(dirname "$0")


## Define functions
function terminator_theme() {
	echo "Applying terminator themes..."
	mkdir -p ~/.config/terminator
	cp ../config/terminator/config ~/.config/terminator/config
	echo "Terminator Theme has been updated!"
}

function vim_theme() {
	echo "Applying vim theme..."
	mkdir -p ~/.vim/pack/themes/start
	git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
	cp ../config/vim/vimrc > ~/.vimrc
	echo "Vim theme has been updated!"
}

function fish_prompt() {
	echo "Applying fish prompt..."
	mkdir -p ~/.config/fish
	mkdir -p ~/.config/fish/functions
	cp ../config/fish/fish_prompt.fish ~/.config/fish/functions/fish_prompt.fish
	cp ../config/fish/fish_variables ~/.config/fish/fish_variables
	echo "Fish prompt has been changed"
}

function install_chrome() {
	echo "Installing Google Chrome..."
	sudo apt-get install libxss1 libappindicator1 libindicator7
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp/
	sudo dpkg -i /tmp/google-chrome-stable_current_amd64.deb
	sudo apt install -f
	echo "Google Chrome has been installed"
 }

function install_assh() {
	echo "Install assh"

	git clone https://github.com/moul/assh.git /tmp/assh
	cd /tmp/assh 
	make install
	go build
	sudo cp assh /usr/bin/
	cd $current_dir

	mkdir -p ~/.ssh
	cp ../config/assh/assh.yml ~/.ssh/

	echo ""
	echo "assh done"
	echo ""
}

 function update() {
	 echo "Updating ..."
	 sudo apt update
	 echo "Update complete"
 }
