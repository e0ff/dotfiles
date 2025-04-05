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
vim.opt.winborder = 'rounded'

vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

-- text editing

vim.opt.wrap = false
vim.opt.colorcolumn = "+0"

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
vim.opt.inccommand = 'nosplit'

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

-- terminal

vim.cmd([[ autocmd TermOpen term://* startinsert ]])

-- other

vim.cmd([[
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup filetype_detect_on_rename
        autocmd!
        autocmd BufFilePost * filetype detect
    augroup END
]])
