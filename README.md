# nvim
1. In your zsh shell, type cd
2. mkdir nvim
3. cd nvim
4. mkdir 0.11.0
5. cd 0.11.0
6. wget https://github.com/neovim/neovim-releases/releases/download/v0.11.0/nvim-linux-x86_64.appimage
7. chmod u+x nivm-linux-x86_64.appimage
8. ./nvim-linux-x86_64.appimage --appimage-extract
9. ./squashfs-root/usr/bin/nvim
10. cd
11. vim .zshrc
12. Add these two lines to your .zrshc file:
13. export PATH=”$HOME/nvim/0.11.0/squashfs-root/usr/bin:$PATH”
14. alias nvim=”$HOME/nvim/0.11.0/squashfs-root/usr/bin/nvim”
15. Exit vim
16. cd
17. source .zshrc
18. cd .config
19. If there is a nvim folder there already, rm -r nvim
20. git clone “https://github.com/lloeffel/nvim”
21. git clone --depth 1 https://github.com/wbthomason/packer.nvim\
22.  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
23. nvim .
24. jjjj(enter)(enter)j(enter)
25. :so
26. :PackerSync
27. q!
28. q!
