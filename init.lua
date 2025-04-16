-- init.lua

-- 1. Ensure Lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
-- 2. Set up Lazy.nvim to load plugins
require("lazy").setup("plugins")
--[[
require("lazy").setup({
    -- Telescope
    -- Colorschemes
    {
        'navarasu/onedark.nvim',
        name = 'onedark',
        config = function() vim.cmd("colorscheme onedark") end
    },
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',
    },

    -- Tree-sitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            vim.cmd("TSUpdate")
        end,
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "lua", "python", "bash", "json", "markdown" },
                sync_install = false,
                auto_install = false,
                highlight = {
                    enable = true,
                },
            }
        end,
    },

    -- Tree-sitter Playground
    'nvim-treesitter/playground',

    -- PrimeAgen's Harpoon
    'theprimeagen/harpoon',

    -- Undo Tree
    'mbbill/undotree',

    -- Vim-Fugitive
    'tpope/vim-fugitive',

    -- LSP (Language Server Protocol)
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- Example LSP configurations
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.eslint.setup({})
        end,
    },

    -- Completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',

    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "clangd", "eslint" }
            })
        end
    },

    {
        "L3MON4D3/LuaSnip",
        version = "v2.*", -- optional
        build = "make install_jsregexp", -- optional, for regex-based snippets
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end
    },


-- Lualine and Devicons
'nvim-tree/nvim-web-devicons',
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
})
]]
require("options")
-- Set leader key

