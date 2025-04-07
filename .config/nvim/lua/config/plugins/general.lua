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
        'ibhagwan/fzf-lua',
        branch = 'main',
        config = function()
            local fzf = require('fzf-lua')
            fzf.setup({
                'max-perf',
                winopts = {
                    split = 'belowright 15new',
                    preview = {
                        hidden = 'hidden'
                    }
                }
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
