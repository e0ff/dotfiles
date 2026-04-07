vim.pack.add({ 'https://github.com/elihunter173/dirbuf.nvim' })

require("dirbuf").setup {
    hash_padding = 2,
    show_hidden = true,
}
