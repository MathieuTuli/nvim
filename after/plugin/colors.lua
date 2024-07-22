--
function ColorMyPencils()
    -- vim.cmd.colorscheme("alabaster")
    -- vim.opt.background = "dark"

    vim.g.sonokay_style = "andromeda"
    vim.g.sonokai_better_performance=1
    vim.cmd.colorscheme("sonokai")
    vim.opt.background = "dark"
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils()
