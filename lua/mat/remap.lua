-- 0 LEADER
vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_next, opts)

-- BUFFERS
vim.keymap.set("n", "gn", "<cmd>bn<CR>")
vim.keymap.set("n", "gp", "<cmd>bp<CR>")
vim.keymap.set("n", "gd", "<cmd>bd<CR>")

-- DEV
vim.keymap.set("n", "<leader>l", ":luafile %<CR>")
vim.keymap.set("i", "<leader>l", ":luafile %<CR>")
vim.keymap.set("v", "<leader>l", ":luafile %<CR>")

-- FILE NAV
vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

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
vim.keymap.set("n", "<leader>ot", ":ObsidianTemplate note<CR> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<CR>")
vim.keymap.set("n", "<leader>on", ":!nn<SPACE>")

-- TABS
vim.keymap.set("n", "tbn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "tbp", "<cmd>tabprev<CR>")
vim.keymap.set("n", "tbe", ":tabedit<SPACE>")

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

