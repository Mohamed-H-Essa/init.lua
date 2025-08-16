vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>silent !tmux-sessionizer -s 0 --vsplit<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")
-- vim.keymap.set("n", "<leader>f", function()
--     require("conform").format({ bufnr = 0 })
-- end)

-- Flutter specific keybindings
vim.keymap.set("n", "<leader>fa", ":FlutterRun<CR>")
vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>")
vim.keymap.set("n", "<leader>fr", ":FlutterReload<CR>")
vim.keymap.set("n", "<leader>fR", ":FlutterRestart<CR>")
vim.keymap.set("n", "<leader>fd", ":FlutterDevices<CR>")
vim.keymap.set("n", "<leader>fo", ":FlutterOutlineToggle<CR>")
-- Flutter end

-- open vim messages
vim.keymap.set("n", "<leader>m", ":messages<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")-- this jumps to the next item in the quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- what this does is it jumps to the next item in the quickfix list
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

vim.keymap.set(
    "n",
    "<leader>ea",
    "oassert.NoError(err, \"\")<Esc>F\";a"
)

-- vim.keymap.set(
--     "n",
--     "<leader>ef",
--     "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj"
-- )
--
-- vim.keymap.set(
--     "n",
--     "<leader>el",
--     "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i"
-- )

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
-- Copilot Chat keybindings
vim.keymap.set("n", "<leader>cco", ":CopilotChatOpen<CR>")          -- Open chat
vim.keymap.set("n", "<leader>ccc", ":CopilotChatClose<CR>")         -- Close chat
vim.keymap.set("n", "<leader>cct", ":CopilotChatToggle<CR>")        -- Toggle chat
vim.keymap.set("n", "<leader>ccr", ":CopilotChatReset<CR>")         -- Reset chat

-- Quick actions

-- vim.keymap.set("v", "<leader>ccf", ":CopilotChatFixDiagnostic<CR>") -- Fix diagnostics
-- vim.keymap.set("v", "<leader>cco", ":CopilotChatOptimize<CR>")      -- Optimize code
-- vim.keymap.set("v", "<leader>ccd", ":CopilotChatDocs<CR>")          -- Generate docs
-- vim.keymap.set("v", "<leader>cct", ":CopilotChatTests<CR>")         -- Generate tests

-- Interactive chat
vim.keymap.set("n", "<leader>cci", function()
    local input = vim.fn.input("Ask Copilot: ")
    if input ~= "" then
        vim.cmd("CopilotChat " .. input)
    end
end)
-- Tab navigation (add these to your remap):
vim.keymap.set("n", "gt", ":tabnext<CR>")           -- Next tab
vim.keymap.set("n", "gT", ":tabprev<CR>")           -- Previous tab
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")    -- New tab
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")  -- Close tab

-- Or use numbers:
vim.keymap.set("n", "<leader>1", "1gt")             -- Go to tab 1
vim.keymap.set("n", "<leader>2", "2gt")             -- Go to tab 2
vim.keymap.set("n", "<leader>3", "3gt")             -- Go to tab 3
vim.keymap.set("n", "<leader>4", "4gt")             -- Go to tab 4
vim.keymap.set("n", "<leader>5", "5gt")             -- Go to tab 5

 -- Create splits
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>")    -- Vertical split
vim.keymap.set("n", "<leader>sh", ":split<CR>")     -- Horizontal split
vim.keymap.set("n", "<leader>sc", ":close<CR>")     -- Close current split

-- Navigate between splits
vim.keymap.set("n", "<C-h>", "<C-w>h")              -- Go left
vim.keymap.set("n", "<C-j>", "<C-w>j")              -- Go down
vim.keymap.set("n", "<C-k>", "<C-w>k")              -- Go up
vim.keymap.set("n", "<C-l>", "<C-w>l")              -- Go right

-- Move splits around
vim.keymap.set("n", "<leader>wH", "<C-w>H")         -- Move split far left
vim.keymap.set("n", "<leader>wJ", "<C-w>J")         -- Move split far down
vim.keymap.set("n", "<leader>wK", "<C-w>K")         -- Move split far up
vim.keymap.set("n", "<leader>wL", "<C-w>L")         -- Move split far right

-- Maximize current split (very useful)
vim.keymap.set("n", "<leader>sm", "<C-w>_<C-w>|")       -- Maximize current split
vim.keymap.set("n", "<leader>se", "<C-w>=")             -- Equalize all splits

-- Quick split + file operations
vim.keymap.set("n", "<leader>so", "<C-w>o")             -- Close all other splits

-- Or use Option (Meta) key if easier to reach:
vim.keymap.set("n", "<M-=>", ":resize +2<CR>")                  -- Option + = to grow
vim.keymap.set("n", "<M-->", ":resize -2<CR>")                  -- Option + - to shrink
vim.keymap.set("n", "<M-]>", ":vertical resize +2<CR>")         -- Option + ] to widen
vim.keymap.set("n", "<M-[>", ":vertical resize -2<CR>")         -- Option + [ to narrow

-- I like these for workflow
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")       -- Close all other tabs
vim.keymap.set("n", "<leader>sx", ":topleft 30vsplit | Ex<CR>")



