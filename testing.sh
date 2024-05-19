
git config --global init.defaultBranch main
git config --global user.name "moraeskkj"
git config --global user.email "mooraesz123@gmail.com"

# install polybar
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes
chmod +x setup.sh
./setup.sh

# Another directories will be created using git
echo ""
echo -e "${green}[*]$no_color Creating default directories..."
mkdir -p "$HOME"/.config
mkdir -p "$HOME"/pics/wallpapers
mkdir -p "$HOME"/Downloads
mkdir -p "$HOME"/projects
mkdir -p "$HOME"/mystuffs

git clone https://github.com/moraeskkj/dotfiles.git ~/dotfiles
git clone https://github.com/moraeskkj/all-ctfs ~/capture_the_flag
git clone https://github.com/moraeskkj/learning-c-assignments ~/learning-c-assignments

if [ -d "$HOME/.config/fish/" ]; then
	sudo rm -rf ~/.config/fish/
fi

# the code will overwrite it with my config
sudo rm -rf .config/polybar/

mv -f ~/dotfiles/wallpapers/* ~/pics/wallpapers/
mv -f ~/dotfiles/* ~/.config/
mv ~/my-setup/shells ~/mystuffs/
mv ~/learning-c-assignments ~/projects

echo ""
echo -e "${green}[*]$no_color Setting $getShell as default shell..."
echo "/usr/bin/${getShell}" | sudo tee -a /etc/shells
sudo chsh -s /usr/bin/$getShell $USER

sudo systemctl enable paccache.timer
if [ -n $gVM ]; then
	sudo systemctl enable vmtoolsd.service
	sudo systemctl enable vmware-vmblock-fuse.service
fi

nvim

if [ -f "$HOME/pkgs.log" ]; then
	echo "${red}[*]${no_color}"
	cat ~/pkgs.log
fi

sudo rm -rf ~/go
sudo rm -rf ~/dotfiles
fc-cache -fv
$aurhlpr -Sc
echo ""
echo -e "${green}[*]$no_color Script execution complete. You may reboot now.${no_color}"