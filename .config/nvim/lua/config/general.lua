vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.fsync = true
vim.opt.autochdir = true
vim.opt.mouse = 'a'
vim.opt.undofile = true
vim.opt.formatoptions:remove('t')
vim.opt.updatetime = 500

vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = 'utf-8'

vim.opt.listchars = {
    eol = '$',
    trail = '.',
}

-- ui

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
vim.env.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

vim.cmd([[
    function! SynGroup()
        let l:s = synID(line('.'), col('.'), 1)
        echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    endfun
]])

-- text editing

vim.opt.wrap = false
vim.opt.textwidth = 72
vim.opt.colorcolumn = "80"

-- indentation

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- completion

vim.opt.wildignorecase = true
vim.opt.wildignore = {
    '*.swp', '*.bak', '*.pyc', '*.class', '*.png', '*.jpg', '*.gif', '*.o',
    '.git', '.svn', '.hg'
}

-- searching

vim.opt.ignorecase = true
vim.opt.showmatch = true

-- abbreviations

vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev Q! q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Wq wq
    cnoreabbrev Wa wa
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
]])

vim.cmd([[
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup filetype_detect_on_rename
        autocmd!
        autocmd BufFilePost * filetype detect
    augroup END
]])

-- terminal

vim.cmd([[
    autocmd TermOpen * if &buftype == 'terminal' | call TerminalCommands() | endif
    autocmd TermOpen term://* startinsert
    function TerminalCommands()
        setlocal nonumber
        setlocal norelativenumber
        setlocal signcolumn=no
    endfunction
]])

-- other

vim.diagnostic.config({
    virtual_text = false
})
