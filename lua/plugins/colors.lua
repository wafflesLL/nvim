return {
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "navarasu/onedark.nvim",
    name = "onedark",
    priority = 1000,
    lazy = false,
    config = function()
      -- Define your theme switcher here
      local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
      vim.api.nvim_create_autocmd('TextYankPost', {
        callback = function()
          vim.highlight.on_yank()
        end,
        group = highlight_group,
        pattern = '*',
      })

      function Gruvbox(isTransparent,dark)
        isTransparent = isTransparent or false

        dark = dark or _G.user_profile.dark_mode
        local theme = 'dark'

        if dark == false then
          theme = 'light'
        end
        vim.o.background = theme
        require("gruvbox").setup({
          transparent_mode = isTransparent,
        })
        vim.cmd.colorscheme("gruvbox")
      end

      function Onedark(isTransparent,dark)
        isTransparent = isTransparent or false
        dark = dark or _G.user_profile.dark_mode
        local theme = 'dark'

        if dark == false then
          theme = 'light'
        end
        require("onedark").setup({
          style = theme,
          transparent = isTransparent,
        })
        vim.cmd.colorscheme("onedark")
      end

      function Catp(isTransparent, dark)
        isTransparent = isTransparent or false
        dark = dark or _G.user_profile.dark_mode
        local theme = 'mocha'
        if dark == false then
          theme = 'latte'
        end
        require("catppuccin").setup({
          flavour = theme,
          transparent_background = isTransparent,
        })
        vim.cmd.colorscheme("catppuccin")
      end

      function SetCS(color, isTransparent)

        color = color or _G.user_profile.colorscheme
        isTransparent = isTransparent or _G.user_profile.transparency
        if color == 'gruvbox' then
          Gruvbox(isTransparent)
        elseif color == 'catppuccin' then
          Catp(isTransparent)
        else
          Onedark(isTransparent)
        end
      end

      _G.SetCS = SetCS  -- optional global function
      SetCS()  -- default on start
    end
  },
}
