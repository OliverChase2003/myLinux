require("basic.options")

-- lazy.nvim plugins manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- 最新稳定版本
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--plugins installation
require("lazy").setup({
  --lualine(OK)
  { "nvim-lualine/lualine.nvim" },
  --alpha-nvim(OK)
  {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  --one dark pro theme
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
  --illuminate(default)
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end
  },
  --gitsign(default)
  { "lewis6991/gitsigns.nvim" },
  --vim-lastplace(defaults)
  { "farmergreg/vim-lastplace" },
  --autopairs(default)
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  {
    "karb94/neoscroll.nvim",
    config = function ()
      require('neoscroll').setup({
        easing_function = "cubic",
      })
    end
  },
  --terminal
  {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup{
            size = 20, -- 终端窗口的大小
            open_mapping = [[<leader>tt]], -- 打开终端的快捷键
            shade_filetypes = {},
            direction = 'float',
            float_opts = {
              border = "curved",
              -- "single", "double", "shadow", "curved"
              width = 100,
              height = 20,
              winblend = 3,
          },
        }
    end
  },
  --treesitter(OK)
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  },
  --telescope(default)
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  --lspconfig(OK)
  { "williamboman/mason.nvim" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "clangd", "cmake", "bashls" },
        --add the language server you need here
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
  }
})

-- plugins' config
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.telescope")
require("plugins.cmp")

-- plugins' keymaps
--telescope
vim.g.mapleader = " "
local keymap = vim.keymap.set

local builtin = require('telescope.builtin')
keymap('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
keymap('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
keymap('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
--toggleterm
keymap("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

-- theme
---- One Dark
--vim.cmd("colorscheme onedark")
--vim.cmd("colorscheme onelight")
--vim.cmd("colorscheme onedark_dark")
---- Tokyo Night
vim.cmd("colorscheme tokyonight")
--vim.cmd("colorscheme tokyonight-night")
--vim.cmd("colorscheme tokyonight-storm")
--vim.cmd("colorscheme tokyonight-day")
--vim.cmd("colorscheme tokyonight-moon")
