require("telescope").setup {
  pickers = {
    find_files = {
       find_command = {"rg", "--files", "--sortr=modified"}
    }
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>t', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.reloader, {})
vim.keymap.set('n', '<leader>fl', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({
        search = vim.fn.input("Grep  > ") })
end)


-- vim.keymap.set('n', '<leader>ps', builtin.grep_string, {})
-- vim.keymap.set("n", "<leader>fs", ":Telescope find_files<cr>")
-- vim.keymap.set("n", "<leader>fp", ":Telescope git_files<cr>")
-- vim.keymap.set("n", "<leader>fz", ":Telescope live_grep<cr>")
-- vim.keymap.set("n", "<leader>fo", ":Telescope oldfiles<cr>")
-- vim.keymap.set("n", "<leader>fb", ":Telescope buffers<cr>")
-- vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>")
