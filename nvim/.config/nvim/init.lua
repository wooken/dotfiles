-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Make Ctrl-c behave like Escape in insert mode
vim.keymap.set('i', '<C-c>', '<Esc>', { noremap = true })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
--vim.opt.clipboard:append("unnamedplus")
vim.opt.guifont = "Iosevka Nerd Font Mono:h12"
vim.opt.ignorecase = true  -- Ignore case in search patterns
vim.opt.smartcase = true   -- Override ignorecase when search pattern contains uppercase
vim.opt.showmode = false
vim.opt.undoreload = 0  -- clear undo tree with :edit
vim.opt.joinspaces = false  -- use single space after punctuation when joining lines
vim.opt.showmatch = true  -- show matching brackets
vim.opt.title = true  -- set window title
vim.opt.fileformats = "unix"  -- display raw line endings
vim.opt.synmaxcol = 0  -- disable maximum syntax highlighting character limit
vim.opt.laststatus = 3  -- global statusline (Avante recommended)
vim.opt.undolevels = 1000  -- maximum number of changes that can be undone
vim.opt.tabstop = 4 -- tabs are visually 4 spaces

vim.opt.list = true  -- show invisible characters
vim.opt.listchars = {
    tab = "→ ",
    trail = "●",
    --space = "·",
}

-- Set whitespace colors after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "Whitespace", { fg = "#FFFFFF" })
        vim.api.nvim_set_hl(0, "NonText", { fg = "#FFFFFF" })
    end,
})

-- Enable Treesitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Folding behavior
vim.opt.foldenable = false      -- Don't fold by default when opening files
vim.opt.foldlevel = 99          -- High value = most folds open by default
vim.opt.foldlevelstart = 99     -- Start with all folds open
vim.opt.swapfile = false  -- don't create swap files

-- Optional: nicer fold display
vim.opt.foldcolumn = "1"        -- Show fold column (0 to hide)
vim.opt.fillchars = { fold = " " }  -- Cleaner fold display

if vim.fn.executable("rg") == 1 then
  vim.opt.grepprg = "rg --vimgrep --smart-case"
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here

    {
      "hardhackerlabs/theme-vim",
      name = "hardhacker",
      lazy = false,
      priority = 1000,
      config = function()
        vim.g.hardhacker_hide_tilde = 1
        vim.g.hardhacker_keyword_italic = 1
        -- custom highlights
        vim.g.hardhacker_custom_highlights = {}
        vim.cmd("colorscheme hardhacker")
      end,
    },

    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        local configs = require("nvim-treesitter.config")
        configs.setup({
          ensure_installed = { "python", "lua", "vim", "go", "yaml", "toml", "json" },
          highlight = { enable = true },
          indent = {
            enable = true,
            disable = { "python" },
          },
        })
      end,
    },

    { "jeffkreeftmeijer/vim-numbertoggle" },
    { "tpope/vim-fugitive" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "Yggdroot/indentLine" },
    { "airblade/vim-gitgutter" },
    { "Vimjas/vim-python-pep8-indent" },
    { "lifepillar/vim-cheat40" },
    { "mtdl9/vim-log-highlighting" },

    -- LSP
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },

    -- Avante
    {
      "yetone/avante.nvim",
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      -- ⚠️ must add this setting! ! !
      build = vim.fn.has("win32") ~= 0
          and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
          or "make",
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      ---@module 'avante'
      ---@type avante.Config
      opts = {
        -- add any opts here
      },
      config = function()
        require("avante-config")  -- load additional config
      end,
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        }
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

  }, -- endpsec
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "hardhacker" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})

vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}
vim.lsp.enable('pyright')
vim.lsp.enable('lua_ls')

local cmp = require('cmp')
cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' }
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  })
})

-- Show diagnostic in floating window
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Navigate diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Show all diagnostics in location list
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = "palenight",
  },
}

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.commands, { desc = 'Telescope: Commands' })

-- fugitive
vim.api.nvim_create_user_command("Gblame", "Git blame", {})

vim.g.cheat40_use_default = 0  -- disable default cheat40 mappings

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "sh", "zsh", "bash", "shell" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4   -- or 4 — pick your poison
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- to migrate
-- Plug 'wooken/url-ghrey-tea', {'do': ':UpdateRemotePlugins'}
-- nnoremap <LEADER>ggo :GHOpenUrl<CR>
-- nnoremap <LEADER>ggl :GHGetUrl<CR>
