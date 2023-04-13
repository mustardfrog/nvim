local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            local keymap_opts = { buffer = buffer }
            -- Hover actions
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.implementation, keymap_opts)
            vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, keymap_opts)
            vim.keymap.set("n", "1gD", vim.lsp.buf.type_definition, keymap_opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, keymap_opts)
            vim.keymap.set("n", "g0", vim.lsp.buf.document_symbol, keymap_opts)
            vim.keymap.set("n", "gW", vim.lsp.buf.workspace_symbol, keymap_opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, keymap_opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, keymap_opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, keymap_opts)
            vim.keymap.set("n", "<Leader>rn", vim.lsp.buf.rename, keymap_opts)
            vim.keymap.set("n", "gl", vim.diagnostic.open_float , keymap_opts)
        end,
    },
    vim.cmd[[
    autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
    ]]
})
