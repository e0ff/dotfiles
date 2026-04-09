vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local treesitter = require('nvim-treesitter')
treesitter.install({
    'c',
    'cpp',
    'lua',
    'gitcommit',
    'sql',
    'python',
    'go',
    'gomod',
    'gosum',
    'html',
    'css',
    'javascript',
    'typescript',
    'json',
    'rust',
    'markdown',
    'typst',
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match)
        local installed = treesitter.get_installed()
        local is_installed = vim.tbl_contains(installed, lang)
        if not is_installed then
            return
        end

        vim.treesitter.start(ev.buf)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
    desc = "enable treesitter",
})
