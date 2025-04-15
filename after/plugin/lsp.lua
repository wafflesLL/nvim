vim.opt.signcolumn = "yes"

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lspconfig_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		--keybinds
		local opts = {buffer = event.buf}
		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)	
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)	
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)	
		vim.keymap.set({'n','x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)	
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)	
	end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {'lua_ls', 'rust_analyzer', 'eslint', 'clangd'}, 
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT',
                            path = {"lua/?.lua","lua/?/init.lua"},
						},
						diagnostics = {
							globals = {'vim'},
						},
						workspace =  {
							library = {vim.env.VIMRUNTIME},
                            checkThirdParty = false,
						},
					},
				},
			})
		end,
	},
})

local cmp = require('cmp')
require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
    --preselect = 'item',
    completion = {
        completopt = 'menu,menuone,noinsert'
    },
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
        {name = 'luasnip'},
	},
	snippet = {
		expand = function(args)
            require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        --window nav
		['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		--docs nav
        ['<C-w>'] = cmp.mapping.scroll_docs(-4),
        ['<C-s>'] = cmp.mapping.scroll_docs(4),

		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1
			if cmp.visible() then
			  cmp.select_next_item({behavior = 'select'})
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
			  fallback()
			else
			  cmp.complete()
			end
		  end, {'i', 's'}),
		  -- Go to previous item
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
	}),
})

vim.diagnostic.config({
    virtual_text = false;
    signs = true,
    update_in_insert = false,
    underline = true,
    float = {
        border = "rounded",
        source = "always",
    },
})

vim.api.nvim_create_autocmd("CursorHold", {
  pattern = "*",
  callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
  end,
})
