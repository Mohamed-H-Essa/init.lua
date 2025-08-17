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
                -- FLUTTER-SPECIFIC IGNORE PATTERNS
                file_ignore_patterns = {
                    -- Build and generated directories
                    "android/",
                    "ios/",
                    "linux/",
                    "macos/",
                    "windows/",
                    "web/",
                    "build/",
                    ".dart_tool/",

                    -- Dependencies and caches
                    "node_modules/",
                    ".git/",
                    "%.lock",

                    -- Flutter specific generated files
                    "%.g.dart$",           -- Generated files (json_serializable, etc.)
                    "%.freezed.dart$",     -- Freezed generated files
                    "%.gr.dart$",          -- Auto Route generated files
                    "%.config.dart$",      -- Config generated files
                    "%.mocks.dart$",       -- Mockito generated files

                    -- Flutter plugin and build files
                    ".flutter%-plugins",
                    ".flutter%-plugins%-dependencies",
                    ".packages",
                    ".metadata",

                    -- IDE and misc
                    ".vscode/",
                    ".idea/",
                    "*.iml",
                    ".DS_Store",
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
                   -- Use fd if available (much faster)
                    find_command = {
                        "fd",
                        "--type", "f",
                        "--strip-cwd-prefix",
                        "--exclude", "android",
                        "--exclude", "ios",
                        "--exclude", "linux",
                        "--exclude", "macos",
                        "--exclude", "windows",
                        "--exclude", "web",
                        "--exclude", "build",
                        "--exclude", ".dart_tool"
                    },
                },

                live_grep = {
                    -- Focus on lib/ directory primarily
                    additional_args = function(opts)
                        return {
                            "--exclude-dir=android",
                            "--exclude-dir=ios",
                            "--exclude-dir=linux",
                            "--exclude-dir=macos",
                            "--exclude-dir=windows",
                            "--exclude-dir=web",
                            "--exclude-dir=build",
                            "--exclude-dir=.dart_tool",
                            "--exclude=*.g.dart",
                            "--exclude=*.freezed.dart",
                            "--exclude=*.gr.dart",
                            "--exclude=*.mocks.dart"
                        }
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

        -- FLUTTER-OPTIMIZED KEYMAPS
        -- Primary file finding (searches only relevant Flutter files)
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Find Flutter files" })

        -- Git files (naturally excludes build directories)
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Git files" })

        -- Search specifically in lib/ directory (main Flutter code)
        vim.keymap.set('n', '<leader>pl', function()
            builtin.find_files({
                cwd = "lib/",
                prompt_title = "Flutter Lib Files"
            })
        end, { desc = "Find files in lib/" })

        -- Search in test/ directory
        vim.keymap.set('n', '<leader>pt', function()
            builtin.find_files({
                cwd = "test/",
                prompt_title = "Flutter Test Files"
            })
        end, { desc = "Find test files" })

        -- Text searching (with Flutter exclusions)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Search text" })

        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "Search word under cursor" })

        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "Search WORD under cursor" })

        -- Live grep (real-time search)
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "Live grep" })

        -- Live grep in lib/ only
        vim.keymap.set('n', '<leader>pgl', function()
            builtin.live_grep({
                cwd = "lib/",
                prompt_title = "Live Grep in Lib"
            })
        end, { desc = "Live grep in lib/" })

        -- Other useful pickers
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = "Find buffers" })
        vim.keymap.set('n', '<leader>po', builtin.oldfiles, { desc = "Recent files" })
        vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = "Resume search" })
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "Help tags" })

        -- Flutter-specific: Search for widgets/classes
        vim.keymap.set('n', '<leader>pw', function()
            builtin.live_grep({
                default_text = "class.*Widget",
                prompt_title = "Find Widgets"
            })
        end, { desc = "Find Widget classes" })

    end
}
