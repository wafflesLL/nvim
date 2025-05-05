--increment the numbers your cursor is on
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- escape to the directory
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

--fast scroll`
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

--input a pattern "/pattern" and then use these to navigate between the next ones in ur pattern
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--format code block
vim.keymap.set("n", "=ap", "ma=ap'a")

--restart LSP
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to clipboard 
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete without copying
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

--removing nasty Ex mode
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--format file based on lsp standards
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

--search and replace shortcut
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--SOURCE!
vim.keymap.set("n", "<leader>so", function()
    vim.cmd("so")
    print("source!")
end)

--screen splitting shortcuts
vim.keymap.set("n", "<leader>te", ":tabedit<Return>", { silent = true })
vim.keymap.set("n", "ss", ":split<Return><C-w>w", { silent = true })
vim.keymap.set("n", "sv", ":vsplit<Return><C-w>w", { silent = true })
vim.keymap.set("n", "<leader><Space>", "<C-w>w", { silent = true })

vim.keymap.set("", "s<Left>", "<C-w>h")
vim.keymap.set("", "s<Right>", "<C-w>l")
vim.keymap.set("", "s<Up>", "<C-w>k")
vim.keymap.set("", "s<Down>", "<C-w>j")

vim.keymap.set("", "sh", "<C-w>h")
vim.keymap.set("", "sl", "<C-w>l")
vim.keymap.set("", "sk", "<C-w>k")
vim.keymap.set("", "sj", "<C-w>j")

vim.keymap.set("n", "<C-w><Left>", "<C-w><")
vim.keymap.set("n", "<C-w><Right>", "<C-w><")
vim.keymap.set("n", "<C-w><Up>", "<C-w><")
vim.keymap.set("n", "<C-w><Down>", "<C-w><")
vim.keymap.set("n", "s<Tab>", "<C-w>|<C-w>_")
vim.keymap.set("n", "<leader>s<Tab>", "<C-w>=")

--highlight everything
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

--options
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.mouse = ""

vim.opt.updatetime = 50
vim.opt.wildignore:append { '*/node-modules/*' }

--turn off autocommenting
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

