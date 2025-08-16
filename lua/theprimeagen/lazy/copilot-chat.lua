return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "main",
        dependencies = {
            { "github/copilot.vim" }, -- Your existing copilot
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        config = function()
            require("CopilotChat").setup {
                debug = false,

                -- Model selection
                model = "gpt-4", -- or "gpt-3.5-turbo"

                -- UI customization
                window = {
                    layout = 'vertical', -- 'vertical', 'horizontal', 'float', 'replace'
                    width = 0.5, -- fractional width of parent, or absolute width in columns when > 1
                    height = 0.5, -- fractional height of parent, or absolute height in rows when > 1
                    -- Options below only apply to floating windows
                    relative = 'editor', -- 'editor', 'win', 'cursor', 'mouse'
                    border = 'single', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
                    row = nil, -- row position of the window, default is centered
                    col = nil, -- column position of the window, default is centered
                    title = 'Copilot Chat', -- title of chat window
                    footer = nil, -- footer of chat window
                    zindex = 1, -- determines if window is on top or below other floating windows
                },

                -- Chat settings
                question_header = '## User ', -- Header to use for user questions
                answer_header = '## Copilot ', -- Header to use for AI answers
                error_header = '## Error ', -- Header to use for errors
                separator = '───', -- Separator to use in chat

                -- Show help actions with chat
                show_help = true,
                -- Show folds for sections in chat
                show_folds = true,
                -- Highlight selection in source buffer when in chat
                highlight_selection = true,
                -- Highlight headers in chat, disable if using markdown treesitter
                highlight_headers = false,

                -- Auto-follow cursor in chat
                auto_follow_cursor = true,
                -- Auto insert mode when opening chat
                auto_insert_mode = false,

                -- Clear chat on new conversation
                clear_chat_on_new_conversation = false,
            }
        end,
    }
}
