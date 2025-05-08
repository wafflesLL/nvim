# nvim
## Setup
Prerequisites: have the latest nvim 0.11.0 installed get it [here](https://github.com/neovim/neovim/releases/), and be on a linux system or a windows linux subsystem or mac linux subsystem, and have a "Nerd Font" downloaded to your machine so that your command shell can process icons. I use AtkynsonMono Nerd Font you can find and download it [here](https://www.nerdfonts.com/font-downloads)
1. Open whatever command shell you prefer
2. ```bash```
3. ```cd ~```
4. ```cd .config``` (if there is no .config directory, ```mkdir .config``` and then ```cd .config```)
5. If there is a nvim folder there already, ```rm -r nvim```
6. ```git clone https://github.com/lloeffel/nvim```
7. ```cd nvim```
8. ```nvim .```
9. ```:Lazy sync```

When opening a file with nvim, tree sitter may have to update and just let it do its thing, then exit the file and open it again for everything to work

If you are transferring from one setup to another, and there are conflicts, you may have to delete files/directories in your ~/.local/share/ folder which correspond to corrupted plugins

## Custom vim commands: (leader is SPACE) (defined in init.lua)
### Incrementing
* ```+``` increments a number the cursor is hovering (NORMAL)
* ```-``` decrements a number the cursor is hovering (NORMAL)
### Directory Navigation
* ```<leader>pv``` goes out to the directory (NORMAL)
### File Navigation
* ```Ctrl + d``` scrolls down quickly when held down (NORMAL)
* ```Ctrl + u``` scrolls up quickly when held down (NORMAL)
### Formatting
* ```=ap``` format the code block you are in (NORMAL)
* ```<leader>f``` format file based on the LSP (NORMAL)
### LSP
* ```<leader>zig``` restart the LSP (NORMAL)
### Copy/Paste
* ```<leader>p``` pastes over your visual selection without yanking the replaced text (VISUAL)
* ```<leader>y``` copies like ```y``` would but to your system clipboard (THIS WILL NOT WORK THROUGH SSH---unless you are using X-forwarding) (VISUAL, NORMAL)
* ```<leader>Y``` copies like ```Y``` would but to your system clipboard (THIS WILL NOT WORK THROUGH SSH---unless you are using X-forwarding) (VISUAL, NORMAL)
* ```<leader>d``` deletes like ```d``` but does not yank the deleted text (VISUAL, NORMAL)
### TMUX

### Search and Replace
* ```<leader>s``` takes the word the cursor is on, and allows you to edit every reference of that word simultaneously in the code (NORMAL)
### Screen splitting/Tabbing
* ```<leader>te``` creates a new tab (NORMAL)
* ```ss``` does a horizontal split and navigates to the new window (NORMAL)
* ```sv``` does a vertical split and navigates to the new window (NORMAL)
* ```<leader><SPACE>``` navigates to the next window (NORMAL)
* ```s<TAB>``` fullscreen for current window (NORMAL)
* ```<leader>s<TAB>``` equal sizes for all windows (NORMAL)
#### Arrow key movement (for the psychos out there)
* ```s<UP>``` navigates to the window above the current (NORMAL)
* ```s<DOWN>``` navigates to the window below the current (NORMAL)
* ```s<LEFT>``` navigates to the window to the left of the current (NORMAL)
* ```s<RIGHT>``` navigates to the window to the right of the current (NORMAL)
#### HJKL key movement (for the chads out there)
* ```sk``` navigates to the window above the current (NORMAL)
* ```sj``` navigates to the window below the current (NORMAL)
* ```sh``` navigates to the window to the left of the current (NORMAL)
* ```sl``` navigates to the window to the right of the current (NORMAL)
#### Ctrl-w movement with arrow keys (for the MEGA psychos out there)
* ```Ctrl + w<UP>``` navigates to the window above the current (NORMAL)
* ```Ctrl + w<DOWN>``` navigates to the window below the current (NORMAL)
* ```Ctrl + w<LEFT>``` navigates to the window to the left of the current (NORMAL)
* ```Ctrl + w<RIGHT>``` navigates to the window to the right of the current (NORMAL)
### Misc
* ```Ctrl + a``` highlights all of the file (NORMAL)


## Plugins Guide:

### Lazy:
[folke/lazy.nvim](https://github.com/folke/lazy.nvim)
* Open Lazy with ```:Lazy```
* Sync your plugins with ```:Lazy sync```

### LSP:



