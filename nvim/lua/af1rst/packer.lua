-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/popup.nvim' }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'nvim-telescope/telescope-symbols.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
--  use { 'nvim-telescope/telescope-fzf-native.nvim', build='make' }
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { 'renerocksai/telekasten.nvim',
        requires = {'nvim-telescope/telescope.nvim'} }
  use { 'renerocksai/calendar-vim' }
  -- install without yarn or npm
  use { 'iamcco/markdown-preview.nvim',
       run = function() vim.fn["mkdp#util#install"]() end, }
  -- View
  use { 'ellisonleao/gruvbox.nvim' }
  use { 'rebelot/kanagawa.nvim' }
  use { 'tanvirtin/monokai.nvim' }
  use { 'olimorris/onedarkpro.nvim' }
  -- Show colors
  use({
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup({ '*' })
        end,
    })
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'challenger-deep-theme/vim', name = 'challenger-deep-theme' }
  use { 'kyoz/purify', rtp= 'vim' }
  use { 'ayu-theme/ayu-vim' }
  use { 'Abstract-IDE/Abstract-cs' } -- colorscheme abscs
  use { 'Soares/base16.nvim' }
  use { 'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'nvim-tree/nvim-web-devicons' }

  use { 'kylechui/nvim-surround',
      tag = '*', -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require('nvim-surround').setup({
              -- Configuration here, or leave empty to use defaults
              --     Old text                    Command         New text
              --------------------------------------------------------------------
              --  surr*ound_words             ysiw)           (surround_words)
              --  *make strings               ys$"            "make strings"
              --  [delete ar*ound me!]        ds]             delete around me!
              --  remove <b>HTML t*ags</b>    dst             remove HTML tags
              --  'change quot*es'            cs'"            "change quotes"
              --  <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
              --  delete(functi*on calls)     dsf             function calls
          }) end }
  use { 'f-person/git-blame.nvim' }

  use { 'stsewd/isort.nvim', ft = 'python', config = 'vim.cmd [[UpdateRemotePlugins]]' }

  use { 'theprimeagen/harpoon' }
  use { 'theprimeagen/refactoring.nvim' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use { 'majutsushi/tagbar' }

  -- Database
  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }
  use { 'talek/vorax4' }

  -- Notifications
  use { 'rcarriga/nvim-notify' }
  use {'adoyle-h/lsp-toggle.nvim'}
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  -- Treesitter
  use({"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"})
  use("nvim-treesitter/playground")
  use("nvim-treesitter/nvim-treesitter-context");

  use({ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' })

  -- highlighters
  use { 'jackguo380/vim-lsp-cxx-highlight' }
  use { 'elzr/vim-json' }
  use { 'honza/dockerfile.vim' }
  use { 'bfrg/vim-cpp-modern' }
  use { 'beyondmarc/glsl.vim' }
  --
  use { 'folke/zen-mode.nvim' }
  use { 'laytan/cloak.nvim' }
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim"
    }
  }
end)

