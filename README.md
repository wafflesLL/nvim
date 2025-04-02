# nvim
In your zsh shell, type cd
mkdir nvim
cd nvim
mkdir 0.11.0
wget https://github.com/neovim/neovim-releases/releases/download/v0.11.0/nvim-linux-x86_64.appimage
chmod u+x nivm-linux-x86_64.appimage
./nvim-linux-x86_64.appimage --appimage-extract
./squashfs-root/usr/bin/nvim
cd
vim .zshrc
Add these two lines to your .zrshc file:
export PATH=”$HOME/nvim/0.11.0/squashfs-root/usr/bin:$PATH”
alias nvim=”$HOME/nvim/0.11.0/squashfs-root/usr/bin/nvim”
Exit vim
cd
source .zshrc
cd .config
If there is a nvim folder there already, rm -r nvim
git clone “https://github.com/lloeffel/nvim”
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim .
jjjj(enter)(enter)j(enter)
:so
:PackerSync
q!
q!
