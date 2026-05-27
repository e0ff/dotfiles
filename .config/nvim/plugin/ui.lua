vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/rmehri01/onenord.nvim',
})

local colors = require('onenord.colors').load()

require('onenord').setup({
    styles = {
        comments = "italic",
    },
    custom_highlights = {
        ["SpellBad"] = { style = 'undercurl', sp = colors.red },
        ["@type"] = { style = 'bold' },
        ["@type.builtin"] = { style = 'bold' },
        ["@keyword.conditional"] = { style = 'italic' },
        ["@keyword.repeat"] = { style = 'italic' },
    }
})
