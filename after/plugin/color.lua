function ColorMyPencils(color)
	color = color or "tokyonight-night"
	vim.cmd.colorscheme(color)
    -- vim.opt.background="dark"

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none", fg = "#66cc99"})
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
	-- vim.api.nvim_set_hl(0, "CursorLine", { bg = "#333333"})
end
ColorMyPencils(color)
