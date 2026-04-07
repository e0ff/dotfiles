vim.pack.add({
    'https://github.com/nvim-neotest/nvim-nio',
    'https://github.com/mfussenegger/nvim-dap',
    'https://github.com/rcarriga/nvim-dap-ui',
})

local dap = require('dap')

local opts = { noremap = true }
vim.keymap.set("n", "<F5>", function() dap.continue() end, opts)
vim.keymap.set("n", "<F3>", function() dap.step_over() end, opts)
vim.keymap.set("n", "<F2>", function() dap.step_into() end, opts)
vim.keymap.set("n", "<F12>", function() dap.step_out() end, opts)
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, opts)
vim.keymap.set("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, opts)
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, opts)

local dap_ui = require("dapui")

dap_ui.setup()

dap.listeners.before.attach.dapui_config = function()
    dap_ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dap_ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dap_ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dap_ui.close()
end
