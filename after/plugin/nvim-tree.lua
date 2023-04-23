-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.cmd[[
-- augroup ProjectDrawer
--     autocmd!
--     autocmd VimEnter * if argc() == 0 | Explore! | endif
-- augroup END
-- ]]

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
-- require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  hijack_netrw = true,
  renderer = {
    group_empty = true,
  },
  filters = {
      dotfiles = true,
  },
  view = {
      centralize_selection = false,
      cursorline = true,
      debounce_delay = 15,
      width = 30,
      hide_root_folder = false,
      side = "right",
      preserve_window_proportions = false,
      number = false,
      relativenumber = false,
      signcolumn = "yes",
      mappings = {
          custom_only = false,
          list = {
              -- { key = "u", action = "dir_up" },
              -- user mappings go here
          },
      },
      float = {
          enable = false,
          quit_on_focus_loss = true,
          open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 30,
              height = 30,
              row = 1,
              col = 1,
          },
      },
  },

})

vim.keymap.set("n", "<leader>e",vim.cmd.NvimTreeToggle )
