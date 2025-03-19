-- 0 LEADER
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_next, opts)

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end
vim.keymap.set('n', '<leader>qf', quickfix, opts)

vim.api.nvim_create_user_command('QuickFixAll', function()
    -- Get all diagnostics in the current buffer
    local diagnostics = vim.diagnostic.get(0)

    -- Sort diagnostics by line and column
    table.sort(diagnostics, function(a, b)
        if a.lnum ~= b.lnum then
            return a.lnum < b.lnum
        end
        return a.col < b.col
    end)

    -- Process each diagnostic
    for _, diagnostic in ipairs(diagnostics) do
        -- Move cursor to the diagnostic position
        vim.api.nvim_win_set_cursor(0, { diagnostic.lnum + 1, diagnostic.col })

        -- Get available code actions for this diagnostic
        vim.lsp.buf.code_action({
            context = { only = { "quickfix" } },
            apply = true,
            filter = function(action)
                -- Only apply quickfix actions
                return action.kind == "quickfix"
            end
        })

        -- Small delay to allow LSP server to respond
        vim.cmd("sleep 50m")
    end
end, {})

-- BUFFERS
vim.keymap.set("n", "gn", "<cmd>bn<CR>")
vim.keymap.set("n", "gp", "<cmd>bp<CR>")
vim.keymap.set("n", "gd", "<cmd>bd<CR>")

-- COLORS
vim.keymap.set('n', '<leader>bl', ':set background=light<CR>',
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bd', ':set background=dark<CR>',
    { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bt', function()
    vim.g.alabaster_dim_comments = not vim.g.alabaster_dim_comments
    vim.cmd('colorscheme alabaster')
end, { noremap = true, silent = true })

-- DEV
-- vim.keymap.set({'n', 'v'}, '<leader>l', [[:<C-u>luafile %<CR>]], { noremap = true, silent = true })

-- FILE NAV
vim.keymap.set("n", "<leader>ff", "<CMD>Oil<CR>")
-- vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>ff", ":NERDTree %<CR>")

-- FORMATTING
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- GENERAL
-- search and replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- void delete to not replace buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornhaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- MACROS
vim.keymap.set("n", "Q", "@q")
vim.keymap.set("n", "Y", "y$")

-- MOVING LINES
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- NAVIGATION
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "\\]", "<cmd>cn<CR>")
vim.keymap.set("n", "\\[", "<cmd>cp<CR>")

-- NOP
-- vim.keymap.set("i", "<C-y>", "<C-k>")
vim.keymap.set("i", "<C-k>", "<Nop>")

-- NOTES
vim.keymap.set("n", "<leader>ok", ":!ng '%:p'<CR>:bd<CR>")
vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<CR>:bd<CR>")
vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<CR>:noh<CR>")
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate note<CR>dd:s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<CR>:noh<CR>")
vim.keymap.set("n", "<leader>on", ":!nn<SPACE>")

-- TABS
vim.keymap.set("n", "tbn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "tbp", "<cmd>tabprev<CR>")
vim.keymap.set("n", "tbe", ":tabedit<SPACE>")

-- TEMPLATES
vim.keymap.set("n", "<leader>ct",
    [[:let root=stdpath("config") | let ext=expand("%:e") | let x=expand(root .. "/templates/" .. ext .. "." .. ext) | r `=x`<CR>]])


-- TODO TMUX
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- TODO REVISIT
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")
