# nvim
1. In your zsh shell, type cd
2. mkdir nvim
3. cd nvim
4. mkdir 0.11.0
5. wget https://github.com/neovim/neovim-releases/releases/download/v0.11.0/nvim-linux-x86_64.appimage
6. chmod u+x nivm-linux-x86_64.appimage
7. ./nvim-linux-x86_64.appimage --appimage-extract
8. ./squashfs-root/usr/bin/nvim
9. cd
10. vim .zshrc
11. Add these two lines to your .zrshc file:
12. export PATH=”$HOME/nvim/0.11.0/squashfs-root/usr/bin:$PATH”
13. alias nvim=”$HOME/nvim/0.11.0/squashfs-root/usr/bin/nvim”
14. Exit vim
15. cd
16. source .zshrc
17. cd .config
18. If there is a nvim folder there already, rm -r nvim
19. git clone “https://github.com/lloeffel/nvim”
20. git clone --depth 1 https://github.com/wbthomason/packer.nvim\
21.  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
22. nvim .
23. jjjj(enter)(enter)j(enter)
24. :so
25. :PackerSync
26. q!
27. q!
