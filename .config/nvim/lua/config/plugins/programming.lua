return {
    'machakann/vim-sandwich',
    'ziglang/zig.vim',

    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            local ibl = require('ibl')
            ibl.setup({
                scope = {
                    show_start = false,
                    show_end = false,
                },
            })
        end
    },

    {
        'danymat/neogen',
        config = function()
            local neogen = require('neogen')
            neogen.setup({
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
        end
    },

    {
        "olexsmir/gopher.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
}
