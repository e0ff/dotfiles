function ColorMyPencils(color)
	color = color or "darkblue"
    if vim.env.TERM == "xterm-256color" then
        color = "elflord"
    end
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
