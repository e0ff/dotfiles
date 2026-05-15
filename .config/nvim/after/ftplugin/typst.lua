vim.opt_local.spell = true
vim.opt_local.wrap = true
vim.opt_local.formatoptions:append('t')

vim.opt_local.colorcolumn = "0"

vim.keymap.set("n", "<localleader>p", ":TypstPreview<cr>", { noremap = true, buffer = 0 })
