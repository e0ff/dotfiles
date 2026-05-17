vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

local conform = require('conform')
conform.setup({
    formatters_by_ft = {
        python = { "isort", "black" }
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_format = "fallback"
    }
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
        require("conform").format({ bufnr = args.buf, async = true })
    end,
})
