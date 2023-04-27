function ColorMyPencils(color)
	-- color = color or "catppuccin-macchiato"
	-- color = color or "tokyonight-moon"
	-- color = color or "rose-pine-dawn"
	color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
end
ColorMyPencils(color)
