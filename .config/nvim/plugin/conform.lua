vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

local conform = require('conform')
conform.setup({
    formatters_by_ft = {
        python = { "isort", "black" },
        c = { "clang_format", lsp_format = "never" },
        cpp = { "clang_format", lsp_format = "never" },
    },
    formatters = {
        clang_format = {
            command = "clang-format",
            args = { "-assume-filename", "$FILENAME" },
            condition = function(_, ctx)
                return vim.fs.root(ctx.buf, { ".clang-format" }) ~= nil
            end,
            range_args = function(_, ctx)
                local util = require("conform.util")
                local start_offset, end_offset = util.get_offsets_from_range(ctx.buf, ctx.range)
                local length = end_offset - start_offset
                return {
                    "-assume-filename",
                    "$FILENAME",
                    "--offset",
                    tostring(start_offset),
                    "--length",
                    tostring(length),
                }
            end,
        },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = {
        timeout_ms = 500,
    },
})
