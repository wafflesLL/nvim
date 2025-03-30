
function ColorMyPencils(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "white"})
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "white"})
    vim.api.nvim_set_hl(0, "LineNr", { fg = "Magenta"})
end

ColorMyPencils()
