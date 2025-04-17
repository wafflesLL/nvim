return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      -- Keymaps
      vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>ps", function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end, { desc = "Grep string" })

      -- Optional basic config (customize as needed)
      require("telescope").setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { width = 0.9 },
          sorting_strategy = "ascending",
        },
      })
    end,
    cmd = "Telescope", -- Lazy-load only when :Telescope or keymap triggers
  }
}
