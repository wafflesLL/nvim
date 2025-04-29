# nvim

## Setup
1. In your linux shell, type cd
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
20. git clone https://github.com/lloeffel/nvim
21. cd nvim
22. nvim .
29. when opening a file with nvim, tree sitter may have to update and just let it do its thing, then exit the file and open it again for everything to work

## Custom vim commands:


## Plugins Guide:

### Lazy:

Open Lazy with ```:Lazy```
Sync your plugins with ```:Lazy sync```

### LSP:



