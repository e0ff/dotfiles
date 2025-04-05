return {
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            local lualine = require('lualine')
            local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")

            lualine.setup({
                options = {
                    theme = kanagawa_paper,
                    icons_enabled = false,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
            })
        end,
    },

    'nvim-tree/nvim-web-devicons',

    {
        "thesimonho/kanagawa-paper.nvim",
        config = function()
            require("kanagawa-paper").setup({
                styles = {
                    type = { bold = true }
                },
                color_balance = {
                    ink = { brightness = 0.2, saturation = 0.4 },
                    canvas = { brightness = 0, saturation = 0 },
                },
            })
            vim.cmd.colorscheme("kanagawa-paper")
        end
    },

    {
        "elihunter173/dirbuf.nvim",
        config = function()
            require("dirbuf").setup {
                hash_padding = 2,
                show_hidden = true,
            }
        end
    },
}
