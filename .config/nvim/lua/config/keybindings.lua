vim.g.mapleader = ' '
vim.g.maplocalleader = ' m'

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, lhs, rhs, options)
end

-- buffers

map('n', '<leader>bb', ':Pick buffers<cr>', { silent = true })
map('n', '<leader>bk', ':bdelete<cr>')
map('n', '<leader>br', ':e!<cr>')
map('n', '<leader>bn', ':bnext<cr>', { silent = true })
map('n', '<leader>bp', ':bprevious<cr>', { silent = true })

-- code

map('n', '<leader>cf', ':Format<cr>', { silent = true })
map('n', '<leader>cx', ':Trouble diagnostics toggle focus=false<cr>', { silent = true })
map('n', '<leader>cd', ':Neogen<cr>')
map('n', '<leader>cr', ':OverseerRun<cr>')

-- files

map('n', '<leader>ff', ':Pick files<cr>', { silent = true })
map('n', '<leader>fi', ':e ~/.config/nvim/init.lua<cr>', { silent = true })

-- git

map('n', '<leader>gg', ':Git<cr>')
map('n', '<leader>gb', ':Git blame<cr>', { silent = true })
map('n', '<leader>gr', ':Git branch<cr>')
map('n', '<leader>gd', ':Git diff<cr>')
map('n', '<leader>gl', ':Git log<cr>')
map('n', '<leader>gf', ':Pick files tool=\'git\'<cr>')

-- windows

map('n', '<leader>wh', '<C-w>h')
map('n', '<leader>wj', '<C-w>j')
map('n', '<leader>wk', '<C-w>k')
map('n', '<leader>wl', '<C-w>l')

map('n', '<leader>w>', '<C-w>>')
map('n', '<leader>w<', '<C-w><')

map('n', '<leader>wr', '<C-w>r')
map('n', '<leader>wR', '<C-w>R')

map('n', '<leader>wv', ':vsplit<cr>', { silent = true })
map('n', '<leader>ws', ':split<cr>', { silent = true })

map('n', '<leader>w0', '<C-w>o')
map('n', '<leader>wo', '<C-w>w')
map('n', '<leader>w1', '<C-w>q')
map('n', '<leader>wc', '<C-w>q')

map('n', '<leader>wt', '<C-w>t')
map('n', '<leader>wx', '<C-w>x')

-- open

map('n', '<leader>ot', ':15Term<cr>', { silent = true })
map('n', '<leader>oq', ':copen<cr>', { silent = true })

-- toggle

map('n', '<leader>ts', ':set spell!<cr>')
map('n', '<leader>tl', ':set list!<cr>')
map('n', '<leader>to', ':OverseerToggle!<cr>')

-- other

map('n', '<leader>/', ':Pick grep_live<cr>', { silent = true })
map('n', '<leader>xx', ':source ~/.config/nvim/init.lua<cr>')
map({ 'n', 'v' }, '<leader>y', '"+y')
map('n', '<leader>Y', '"+Y')
map('n', '<leader>p', '"0p')
map('n', '<leader>P', '"0P')
map('n', '<leader>l', ':noh<cr>')
map('n', '<leader>u', require('undotree').open)
