vim.pack.add({
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/machakann/vim-sandwich',
    'https://github.com/windwp/nvim-autopairs',
    'https://github.com/lukas-reineke/indent-blankline.nvim',
    'https://github.com/danymat/neogen',
    'https://github.com/folke/todo-comments.nvim',
    'https://github.com/HiPhish/rainbow-delimiters.nvim',
    'https://github.com/stevearc/overseer.nvim',
    'https://github.com/ntpeters/vim-better-whitespace',
    'https://github.com/vimlab/split-term.vim',
})

require('nvim-autopairs').setup()

require('ibl').setup({
    scope = {
        show_start = false,
        show_end = false,
    },
})

require('neogen').setup({
    snippet_engine = 'luasnip',
    input_after_comment = true,
    languages = {
        csharp = {
            template = {
                annotation_convention = 'xmldoc'
            }
        }
    }
})

require('todo-comments').setup()

require('overseer').setup({
    component_aliases = {
        default = {
            "on_exit_set_status",
            "on_complete_notify",
            { "on_output_quickfix",  set_diagnostics = true },
            { "on_complete_dispose", require_view = { "SUCCESS", "FAILURE" } },
        },
    },
})

vim.g.better_whitespace_enabled = true
vim.g.strip_whitespace_on_save = true
vim.g.strip_whitespace_confirm = false
