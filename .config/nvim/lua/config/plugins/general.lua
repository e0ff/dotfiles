return {
    'nvim-lua/plenary.nvim',

    {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g.better_whitespace_enabled = true
            vim.g.strip_whitespace_on_save = true
            vim.g.strip_whitespace_confirm = false
        end
    },

    'vimlab/split-term.vim',

    {
        'nvim-mini/mini.pick',
        version = false,
        config = function()
            require('mini.pick').setup({
                options = {
                    content_from_bottom = true,
                },
            })
        end
    },

    {
        'mbbill/undotree',
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
}
