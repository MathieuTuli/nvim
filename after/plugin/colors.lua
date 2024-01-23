-- require('rose-pine').setup({
--     disable_background = true
-- })
-- 

-- require('sonokai')
vim.g.sonokay_style = "andromeda"
vim.g.sonokai_better_performance=1

function ColorMyPencils(color) 
	color = color or "sonokai"
	vim.cmd.colorscheme(color)
    -- vim.cmd.colorscheme("sonokai")

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()


