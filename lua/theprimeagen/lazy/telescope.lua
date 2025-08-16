return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- Added for file/folder icons
    },

    config = function()
        require('telescope').setup({
            defaults = {
                -- UI improvements
                prompt_prefix = " ",           -- Search icon in prompt
                selection_caret = "➤ ",           -- Arrow for selected item
                entry_prefix = "  ",              -- Spacing for entries

                -- Enable file icons (requires nvim-web-devicons)
                file_ignore_patterns = {         -- Files/folders to ignore
                    "node_modules/",
                    ".git/",
                    ".dart_tool/",               -- Flutter build files
                    "build/",                    -- Flutter/Android build
                    -- "*.lock",                    -- Lock files
                    ".flutter-plugins*",         -- Flutter plugin files
                },

                -- Layout and appearance
                layout_config = {
                    horizontal = {
                        preview_width = 0.6,     -- Preview window takes 60% width
                        results_width = 0.8,     -- Results window width
                    },
                    vertical = {
                        mirror = false,          -- Don't flip layout
                    },
                    width = 0.87,                -- Overall width (87% of screen)
                    height = 0.80,               -- Overall height (80% of screen)
                    preview_cutoff = 120,        -- When to hide preview
                },

                -- Behavior
                sorting_strategy = "ascending",   -- Results from top to bottom
                layout_strategy = "horizontal",   -- Side-by-side layout
            },

            pickers = {
                find_files = {
                    -- Show hidden files but ignore .git
                    hidden = true,
                },

                live_grep = {
                    -- Additional grep options for Flutter
                    additional_args = function(opts)
                        return {"--hidden"}      -- Search in hidden files
                    end
                },

                buffers = {
                    show_all_buffers = true,     -- Show all buffers
                    sort_lastused = true,        -- Most recent first
                    mappings = {
                        i = {
                            ["<c-d>"] = "delete_buffer", -- Ctrl+d to delete buffer
                        }
                    }
                }
            }
        })

        -- Your existing keybindings (unchanged)
        local builtin = require('telescope.builtin')

        -- File finding
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})    -- Project files
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})          -- Git files only

        -- Text searching
        vim.keymap.set('n', '<leader>pws', function()               -- Search word under cursor
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)

        vim.keymap.set('n', '<leader>pWs', function()               -- Search WORD under cursor (includes punctuation)
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)


        vim.keymap.set('n', '<leader>ps', function()                -- Interactive search
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)

        -- Help and other
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})    -- Vim help

        -- Additional useful keybindings (optional)
        -- vim.keymap.set('n', '<leader>pb', builtin.buffers, {})      -- Open buffers
        -- vim.keymap.set('n', '<leader>pr', builtin.resume, {})       -- Resume last search
        -- vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})    -- Live text search
    end
}
