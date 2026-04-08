vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })

require('lualine').setup({
    options = {
        theme = "jellybeans-nvim",
        section_separators = "",
        component_separators = "",
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { { "filename", path = 4 }, "progress", "encoding" },
        lualine_x = { "diff", "diagnostics", "branch", },
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "quickfix", "fugitive", },
})
