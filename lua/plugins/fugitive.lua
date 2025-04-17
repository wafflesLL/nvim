return {
	"tpope/vim-fugitive", -- Fugitive plugin
		lazy = false, -- Lazy-load it when needed
		config = function()
		-- Git status
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

		end
}

