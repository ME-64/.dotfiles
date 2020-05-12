#### Spotify Install

sudo apt install curl
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
sudo apt-get update
sudo apt-get install spotify-client

#### Neovim Install

sudo snap install --beta nvim --classic

#### Python 3.8

sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.8

#### Python3

sudp apt install python3 python3-pip

#### Git

sudo apt install git

#### Remap Caps Lock to Control

setxkbmap -option ctrl:nocaps

#### i3 Config Settings

`exec_always --no-startup-id setxkbmap -option ctrl:nocaps`

gaps inner 10
gaps outer 30
comment out `smart_gaps on`
`smart_gaps inverse_outer`

#### Start workspaces on specific screens

workspace "2" output DVI-I-1
workspace "4" output DP-4
workspace "3" output DP-2
workspace "5" output DP-2
workspace "1" output HDMI-0

exec --no-startup-id spotify premium
assign [class="Spotify Premium"] "5"
for_window [class="Spotify Premium"] move to workspace 5
for_window [class="Spotify"] move to workspace 5

#### Hack NF

https://www.nerdfonts.com/font-downloads

#### Arc-Dark GTK

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/home:Horst3180.list"
wget -nv https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo apt-get install arc-theme

#### Gruvbox

Copy from dotfiles to /etc/regolith/styles/gruvbox

#### Nodejs

curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install npm

#### Vundle

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#### ZSH

sudo apt install zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
chsh -s $(which zsh)

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#### System Clipboard

sudo apt install xsel

#### gtop

sudo npm install gtop -g

#### Spotify Custom

sudo chmod 777 /usr/share/spotify -R
Download from https://github.com/khanhas/spicetify-cli/releases
mkdir ~/spicetify
tar xzf ~/Downloads/spicetify-x.x.x-linux-amd64.tar.gz -C ~/spicetify
sudo ln -s ~/spicetify/spicetify /usr/bin/spicetify
spicetify
spicetify backup apply enable-devtool

#### Firefox Restore

In browser bar:
about:config
browser.sessionstore.resume_from_crash -> false

#### nvim default editor

sudo update-alternatives --install /usr/bin/editor editor /snap/bin/nvim 100

#### Tree

sudo apt install tree

#### fzf

sudo apt install ripgrep
sudo apt install fzf

#### fd-find

sudo apt install fd-find

#### markdown view

pip3 install grip

#### Go

sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

#### vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#### Livedown

npm install -g livedown

#### Neovim Remote

pip3 install neovim-remote


#### Postman

sudo snap install postman


#### tcolors

curl -Lo tcolors https://github.com/bcicen/tcolors/releases/download/v0.2/tcolors-0.2-$(uname -s)-amd64
chmod +x tcolors
sudo mv tcolors /usr/local/bin/


#### Pick

sudo snap install pick-colour-picker

#### Sass

sudo npm install -g sass

#### Gulp

sudo npm install -g gulp
