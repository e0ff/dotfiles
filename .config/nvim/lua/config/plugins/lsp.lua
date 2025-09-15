return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'mason-org/mason.nvim' },
            { 'mason-org/mason-lspconfig.nvim' },

            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },

            { 'L3MON4D3/LuaSnip' },
        },
        config = function()
            local buffer_autoformat = function(bufnr)
                local group = 'lsp_autoformat'
                vim.api.nvim_create_augroup(group, { clear = false })
                vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })

                vim.api.nvim_create_autocmd('BufWritePre', {
                    buffer = bufnr,
                    group = group,
                    desc = 'LSP format on save',
                    callback = function()
                        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
                    end,
                })
            end

            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local id = vim.tbl_get(event, 'data', 'client_id')
                    local client = id and vim.lsp.get_client_by_id(id)
                    if client == nil then
                        return
                    end

                    if client.supports_method('textDocument/formatting') then
                        buffer_autoformat(event.buf)
                    end

                    vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",
                        { noremap = true, silent = true })
                    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
                        { noremap = true, silent = true })

                    vim.api.nvim_command(
                        'autocmd CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false })')
                end,
            })

            local lspconfig = require('lspconfig')
            local lspconfig_defaults = lspconfig.util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {},
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({})
                    end,
                }
            })

            local cmp = require('cmp')
            local luasnip = require('luasnip')

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip', keyword_length = 2 },
                    { name = 'buffer',  keyword_length = 3 },
                    { name = 'path' },
                },
                mapping = cmp.mapping.preset.insert({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                            -- that way you will only jump inside the snippet region
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ['<CR>'] = cmp.mapping.confirm({ select = false }),

                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                }),
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                }
            })
        end
    },

    {
        'j-hui/fidget.nvim',
        config = function()
            require("fidget").setup()
        end
    },

    {
        'ray-x/lsp_signature.nvim',
        config = function()
            local lsp_signature = require('lsp_signature')
            lsp_signature.setup({})
        end
    },

    {
        'folke/trouble.nvim',
        config = function()
            require('trouble').setup({
                modes = {
                    diagnostics = {
                        auto_close = true,
                    }
                }
            })
        end
    },

    {
        'tzachar/local-highlight.nvim',
        config = function()
            require('local-highlight').setup({
                animate = {
                    enabled = false
                }
            })
        end
    },
}
