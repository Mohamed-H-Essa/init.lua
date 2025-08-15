return {
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", -- optional for vim.ui.select
        },
        config = function()
            require("flutter-tools").setup {
                lsp = {
                    color = { -- show the derived colours for dart variables
                        enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
                        background = false, -- highlight the background
                        foreground = false, -- highlight the foreground
                        virtual_text = true, -- show the highlight using virtual text
                        virtual_text_str = "■", -- the virtual text character to highlight
                    },
                    settings = {
                        showTodos = true,
                        completeFunctionCalls = true,
                        -- To be done later flutter doctor wahtever
                        -- analysisExcludedFolders = {
                        --     vim.fn.expand("$HOME/.pub-cache"),
                        --     vim.fn.expand("$HOME/tools/flutter"),
                        -- },
                    }
                },
                debugger = { -- integrate with nvim dap + install dart code debugger
                    enabled = false,
                    run_via_dap = false,
                },
                flutter_path = nil, -- <-- this takes priority over the lookup
                flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
                dev_log = {
                    enabled = true,
                    notify_errors = false, -- if there is an error whilst running then notify the user
                    open_cmd = "tabedit", -- command to use to open the log buffer
                },
            }
        end
    }
}
