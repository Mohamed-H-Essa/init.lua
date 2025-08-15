return {
    "github/copilot.vim",
    config = function()
        -- Enable Copilot for specific filetypes
        vim.g.copilot_filetypes = {
            ["*"] = false,
            ["javascript"] = true,
            ["typescript"] = true,
            ["lua"] = true,
            ["rust"] = true,
            ["dart"] = true, -- Enable for Dart/Flutter
            ["python"] = true,
            ["go"] = true,
            ["html"] = true,
            ["css"] = true,
        }

        -- Optional: Custom keybindings
        vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
            expr = true,
            replace_keycodes = false
        })
    end
}
