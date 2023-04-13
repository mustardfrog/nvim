--vim.opt.guicursor = ""

-- vim.cmd[[
--     set guicursor=n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20,o:hor50
-- ]]
-- vim.opt.background='dark'
-- vim.g.colorscheme="catppuccin-macchiato"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.ignorecase = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.g.mapleader = " "

--vim.opt.colorcolumn = "80"

local function removeColorSignColumn()
    vim.cmd[[highlight SignColumn guibg=NONE]]
end

-- vim.api.nvim_create_autocmd("BufEnter", {
    -- callback = removeColorSignColumn
-- })
