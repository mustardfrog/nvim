require('mustardfrog.wallpaper')
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set({ 'n', 'v' }, "X", "<cmd>only<CR>")

--vim.cmd [[
--    vmap <C-s> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
--]]
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "H", ":bp<CR>")
vim.keymap.set("n", "L", ":bn<CR>")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- painful reality of 60% keyboard
-- vim.keymap.set("i", "ttt", "`")
-- vim.keymap.set("i", "ttd", "~")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- vim.api.nvim_set_keymap('v', '<leader>yy', '<cmd>:call system("wl-copy", @")<cr>:call system("wl-copy", @")<cr>', {noremap = false, silent = false})
-- vim.cmd[[
--     vmap <leader>y y:call system("wl-copy", @")<CR>:call system("wl-copy", @")<CR>
--     ]]
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<cr>", "ciw")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>va", "[[:lua require('mustardfrog.wallpaper').search_wallpapers()<CR>]]")
-- vim.api.nvim_create_autocmd("CursorHold")
--
vim.cmd [[
    " press <Tab> to expand or jump in a snippet. These can also be mapped separately
    " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
    imap <silent><expr> <C-d> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    " -1 for jumping backwards.
    inoremap <silent> <C-r> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <C-d> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <C-r> <cmd>lua require('luasnip').jump(-1)<Cr>
]]

vim.keymap.set('i', '<C-f>', function () return vim.fn['codeium#Accept']() end, { expr = true })
