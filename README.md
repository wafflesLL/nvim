# nvim
## Setup
Prerequizities: have the latest version of nvim installed, and be on a linux system or a windows linux subsystem or mac linux subsystem
1. bash
2. cd ~
3. cd .config (if there is no .config directory, make it)
4. If there is a nvim folder there already, rm -r nvim
5. git clone https://github.com/lloeffel/nvim
6. cd nvim
7. nvim .
8. :Lazy sync
9. when opening a file with nvim, tree sitter may have to update and just let it do its thing, then exit the file and open it again for everything to work

If you are transferring from one setup to another, and there are conflicts, you may have to delete files in your .local folder which correspond to corrupted plugins

## Custom vim commands:


## Plugins Guide:

### Lazy:

Open Lazy with ```:Lazy```
Sync your plugins with ```:Lazy sync```

### LSP:



