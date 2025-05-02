return {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    opts = {
        keymap = {
            preset = 'default',
            ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
            ['<C-e>'] = { 'hide', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
            ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },
            ['<C-k>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-j>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-d>'] = { 'show_documentation', 'fallback' },
        },
        appearance = {
            nerd_font_variant = 'mono'
        },
        completion = {
            documentation = { auto_show = false },
            ghost_text = { enabled = _G.user_profile.ghost_text_enabled },
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
}
