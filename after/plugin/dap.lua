local dap = require('dap')
local dapui = require('dapui')
local dapgo = require('dap-go')

dapui.setup()
dapgo.setup{
  -- Additional dap configurations can be added.
  -- dap_configurations accepts a list of tables where each entry
  -- represents a dap configuration. For more details do:
  -- :help dap-configuration
  dap_configurations = {
    {
      -- Must be "go" or it will be ignored by the plugin
      type = "go",
      name = "Attach remote",
      mode = "remote",
      request = "attach",
    },
  },
  -- delve configurations
  delve = {
    -- time to wait for delve to initialize the debug session.
    -- default to 20 seconds
    initialize_timeout_sec = 20,
    -- a string that defines the port to start delve debugger.
    -- default to string "${port}" which instructs nvim-dap
    -- to start the process in a random available port
    port = "${port}"
  },
}

dap.configurations.cpp = {
    {
        name = "C++ Debug",
        type = 'codelldb', -- which adapter to use
        request = 'launch',
        -- program = '/home/chaeng/.local/share/nvim/mason/bin/codelldb',
        -- program = '${file}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/build/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        console ='integratedTerminal',
    },
    -- {
    --     -- If you get an "Operation not permitted" error using this, try disabling YAMA:
    --     --  ececho 0 | sudo tee /proc/sys/kernel/yama/ptrace_scopeho 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --     name = "Attach to process",
    --     type = 'cpp',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
    --     request = 'attach',
    --     pid = require('dap.utils').pick_process,
    --     args = {},
    -- },
}
dap.adapters.codelldb = {
    name = "Codelldb server",
    type = 'server',
    -- host = '127.0.0.1',
    -- port = 13000, -- 💀 Use the port printed out or specified with `--port`

  port = "${port}",
  executable = {
      command = '/home/chaeng/.local/share/nvim/mason/bin/codelldb',
      args = {"--port", "${port}"},
  }
}

-- dap.configurations = {
--     cpp = {
--               {
--                   type = "cpp", -- Which adapter to use
--                   name = "Debug", -- Human readable name
--                   request = "launch", -- Whether to "launch" or "attach" to program
--                   program = "${file}", -- The buffer you are focused on when running nvim-dap
--               },
--     },
-- }



-- require("neodev").setup({
--   library = { plugins = { "nvim-dap-ui" }, types = true },
--   ...
-- })

require("nvim-dap-virtual-text").setup {
    -- enabled = true,                        -- enable this plugin (the default)
    -- enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    -- highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    -- highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    -- show_stop_reason = true,               -- show stop reason when stopped for exceptions
    -- commented = false,                     -- prefix virtual text with comment string
    -- only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    -- all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    -- --- A callback that determines how a variable is displayed or whether it should be omitted
    -- --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
    -- --- @param buf number
    -- --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
    -- --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
    -- --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
    -- display_callback = function(variable, _buf, _stackframe, _node)
    --     return variable.name .. ' = ' .. variable.value
    -- end,
    --
    -- -- experimental features:
    -- virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    -- all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    -- virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    -- virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
    -- -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
vim.keymap.set('n', '<F5>', dap.continue )
vim.keymap.set('n', '<F10>', dap.step_over )
vim.keymap.set('n', '<F11>', dap.step_into )
vim.keymap.set('n', '<F12>', dap.step_out )
vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint )
vim.keymap.set('n', '<Leader>B', dap.set_breakpoint )
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))end)
vim.keymap.set('n', '<Leader>dr', dap.repl.toggle )
vim.keymap.set('n', '<Leader>dl', dap.run_last )
vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end)

