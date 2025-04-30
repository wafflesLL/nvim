return {
    "neovim/nvim-lspconfig",                 -- LSP configuration plugin
    dependencies = {
        "williamboman/mason.nvim",           -- Mason for managing LSP servers
        "williamboman/mason-lspconfig.nvim", -- LSP server setup via Mason
        "hrsh7th/nvim-cmp",                  -- Completion engine
        "hrsh7th/cmp-nvim-lsp",              -- LSP source for nvim-cmp
        "L3MON4D3/LuaSnip",                  -- Snippet engine
    },
    config = function()
        local lspconfig = require("lspconfig")
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        -- Setting capabilities for LSP
        local lspconfig_defaults = lspconfig.util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- LSP Attach actions
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end,
        })

        -- Mason Setup
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'rust_analyzer', 'eslint', 'clangd' },
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({})
                end,
                lua_ls = function()
                    lspconfig.lua_ls.setup({
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                    path = { "lua/?.lua", "lua/?/init.lua" },
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = { vim.env.VIMRUNTIME },
                                    checkThirdParty = false,
                                },
                            },
                        },
                    })
                end,
            },
        })

        -- Setup nvim-cmp
        require('luasnip.loaders.from_vscode').lazy_load()
        cmp.setup({
            completion = { completopt = 'menu,menuone,noinsert' },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'luasnip' },
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-w>'] = cmp.mapping.scroll_docs(-4),
                ['<C-s>'] = cmp.mapping.scroll_docs(4),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    local col = vim.fn.col('.') - 1
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = 'select' })
                    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
                        fallback()
                    else
                        cmp.complete()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
            }),
        })

        -- Diagnostic configuration
        vim.diagnostic.config({
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = true,
            float = {
                border = "rounded",
                source = 'if_many',
            },
        })

        -- Show diagnostics on cursor hold
        vim.api.nvim_create_autocmd("CursorHold", {
            pattern = "*",
            callback = function()
                vim.diagnostic.open_float(nil, { focusable = false })
            end,
        })
    end
}
