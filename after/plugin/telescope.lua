local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        vim.cmd("silent! lua require('telescope.builtin').find_files()")
    end,
})

require('telescope').setup {
    defaults = {
    },
    pickers = {
        find_files = {
            theme = "dropdown",
            previewer = false,
            -- hidden = true,
        },
        live_grep = {
            theme = "ivy",
        },
        buffers = {
            theme = "dropdown",
            previewer = false,
        },
    },
    extensions = {
        -- ...
    }
}
