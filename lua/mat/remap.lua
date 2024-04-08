vim.keymap.set("n", "<leader>ff", vim.cmd.Ex)

-- Moving lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- navigation
-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- void delete to not replace buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
-- vim.keymap.set("i", "<C-c>", "<Esc>")

-- vim.keymap.set("n", "Q", "<nop>")
-- TODO Revisit these
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- TODO revisit : quick fix nav
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


vim.keymap.set("n", "\\]", "<cmd>cn<CR>")
vim.keymap.set("n", "\\[", "<cmd>cp<CR>")
-- vim.keymap.set("n", "\n", "<cmd>cn<CR>")
-- vim.keymap.set("n", "\p", "<cmd>cp<CR>")
-- vim.keymap.set("n", "\o", "<cmd>copen<CR>")
-- vim.keymap.set("n", "\c", "<cmd>cclose<CR>")
-- vim.keymap.set("n", "\bq", "<cmd>b#<CR>")
-- vim.keymap.set("n", "]<space>", "<cmd>ALENextWrap<CR>")
-- vim.keymap.set("n", "[<space>", "<cmd>ALEPreviousWrap<CR>")

-- Tabs
vim.keymap.set("n", "tbn", "<cmd>tabnext<CR>")
vim.keymap.set("n", "tbp", "<cmd>tabprev<CR>")
vim.keymap.set("n", "tbe", ":tabedit<SPACE>")

-- BUFFERS
vim.keymap.set("n", "gn", "<cmd>bn<CR>")
vim.keymap.set("n", "gp", "<cmd>bp<CR>")
vim.keymap.set("n", "gd", "<cmd>bd<CR>")

vim.keymap.set("n", "Q",  "@q")
vim.keymap.set("n", "Y", "y$")

-- vim.keymap.set("i", "<C-y>", "<C-k>")
vim.keymap.set("i", "<C-k>", "<Nop>")
