vim.pack.add({ 'https://codeberg.org/mfussenegger/nvim-dap-python' })

local dap_python = require('dap-python')
dap_python.setup()
