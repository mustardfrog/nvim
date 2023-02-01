local M = {}

local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
M.search_wallpapers = function()
    builtin.find_files({
        prompt_title = "< Wallpapers >",
        cwd = "~/Pictures/wallpapers/",
        find_command = { "rg", "--files" },
        previewer = false,
        follow = false,
        attach_mappings = function(bufnr, _)
            actions.select_default:replace(function()
                actions.close(bufnr)

                -- local output = vim.fn.system("killall bash")
                local selection = require("telescope.actions.state").get_selected_entry(bufnr)

                -- local cmd = "swaymsg output \'*\' bg " .. selection.cwd .. selection.value .. " fill"
                -- local cmd = "swaybg -i " .. selection.cwd ..  selection.value .. " -m fill -o \'*\'"
                local cmd = "feh " .. selection.cwd .. "/" .. selection.value .. " --bg-fill"
                print(cmd)

                if selection then
                    vim.fn.system(cmd)
                end
            end)
            return true
        end,
    })
end
return M
