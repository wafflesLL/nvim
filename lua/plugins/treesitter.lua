return {
  "nvim-treesitter/nvim-treesitter",  -- Treesitter plugin
  build = function()
    -- Install necessary parsers after plugin setup
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  config = function()
    require'nvim-treesitter.configs'.setup {
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "c", "cpp", "javascript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,  -- Enables syntax highlighting using Treesitter
      },
      additional_vim_regex_highlighting = false,
    }
  end
}
