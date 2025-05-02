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



--PROFILE
local active_user = "lloeffel" -- Change this to switch profiles
local ok, profile = pcall(require, "profiles." .. active_user)
if not ok then
    vim.notify("Failed to load user profile: " .. active_user, vim.log.levels.ERROR)
    profile = {}
end
_G.user_profile = profile
user_profile.ghost_text_enabled = user_profile.ghost_text_enabled ~= false

vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("options")

-- 2. Set up Lazy.nvim to load plugins
require("lazy").setup("plugins",{
    defaults = {lazy  = false},
    spec = {
        {import = "plugins"},
    },
    checker = { enabled = true },
})

