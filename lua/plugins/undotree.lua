return {
  "mbbill/undotree",  -- UndoTree plugin
  config = function()
    -- Key mapping for opening the UndoTree
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  end
}
