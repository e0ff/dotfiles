-- trim whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
        local filetype = vim.api.nvim_buf_get_option(0, "filetype")
        if (filetype ~= 'sql') or (filetype ~= 'plsql')
        then
            vim.cmd([[
            keeppatterns %s/\s\+$//e
            ]])
        end
	end,
	group = vim.api.nvim_create_augroup("TrimWhitespace", { clear = true }),
})

-- switch to absolute line numbers in insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	callback = function()
		vim.opt.relativenumber = false
		vim.opt.cursorline = false
	end,
})

-- switch to relative line numbers in normal mode
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	callback = function()
		vim.opt.relativenumber = true
		vim.opt.cursorline = true
	end,
})
