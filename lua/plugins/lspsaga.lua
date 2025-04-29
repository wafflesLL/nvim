return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = true,
                enable_in_insert = false,
                sign = true,
                virtual_text = true,
            },
            outline = {
                layout = 'float',
                win_width = 40,
                auto_preview = true,
            },
            symbol_in_winbar = {
                enable = true,
                separator = ' → ',
                hide_keyword = true,
                show_file = true,
                folder_level = 1,
            },
            ui = {
                border = 'rounded',
                devicon = true,
            },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
}

