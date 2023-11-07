--vim.g.mapleader = " "
vim.g.gitblame_enabled = 1
vim.g.gitblame_message_template = '<author> • <date> • <summary>'
vim.g.gitblame_date_format = '%c'
vim.g.db_ui_save_location = '~/.config/db_ui'

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/af1rst/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v<CR>") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s<CR>") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=<CR>") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zfn", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zfd", "<cmd>Telekasten find_daily_notes<CR>")
vim.keymap.set("n", "<leader>zfw", "<cmd>Telekasten find_weekly_notes<CR>")
vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zT", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zF", "<cmd>Telekasten find_friends<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zN", "<cmd>Telekasten new_templated_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>")
vim.keymap.set("n", "<leader>zy", "<cmd>Telekasten yank_notelink<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>#", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("n", "<leader>zC", "<cmd>CalendarT<CR>")
-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "<leader>[", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("i", "<leader>zt", "<cmd>Telekasten toggle_todo<CR>")
vim.keymap.set("i", "<leader>zs", "<cmd>Telescope symbols<CR>")
vim.keymap.set("i", "<leader>#", "<cmd>Telekasten show_tags<CR>")

-- db
vim.keymap.set("n", "<leader>du", "<cmd>DBUIToggle<CR>")
vim.keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>DBUIRenameBuffer<CR>")
vim.keymap.set("n", " <leader>dl", "<cmd>DBUILastQueryInfo<CR>")
