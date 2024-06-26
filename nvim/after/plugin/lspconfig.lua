local util = require'lspconfig.util'
require'lspconfig'.gopls.setup {
   -- ...some other setups
   root_dir = function(fname)
      -- see: https://github.com/neovim/nvim-lspconfig/issues/804
      local mod_cache = vim.trim(vim.fn.system 'go env GOMODCACHE')
      if fname:sub(1, #mod_cache) == mod_cache then
         local clients = vim.lsp.get_active_clients { name = 'gopls' }
         if #clients > 0 then
            return clients[#clients].config.root_dir
         end
      end
      return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
   end,
}

