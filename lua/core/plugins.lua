local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "phaazon/hop.nvim" },

    -- treesiiter 
    { "nvim-treesitter/nvim-treesitter" },

    -- neo-tree
    {
 	   "nvim-neo-tree/neo-tree.nvim",
 	   branch = "v3.x",
    	   dependencies = {
      		  "nvim-lua/plenary.nvim",
      		  "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      	 	  "MunifTanjim/nui.nvim", -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
           }
	},

    -- barbar 
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
            "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = {
            -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
            animation = true,
            -- insert_at_start = true,
            -- …etc.
        },
        version = '^1.0.0', -- optional: only update when a new 1.x version is released
    },

    --lsp config
    { 
        "neovim/nvim-lspconfig", 
        config = function()
            require "plugins.lsp"
        end,
    },
	
    -- null-ls.nvim
    { "jose-elias-alvarez/null-ls.nvim", ft = "go" },    

    -- gopher.nvim
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        config = function(_, opts)
            require("gopher").setup(opts)
        end,
        build = function()
            vim.cmd [[silent! GoInstallDeps]]
        end,
    },

    {
        "dreamsofcode-io/nvim-dap-go",
        ft = "go",
        dependencies = "mfussenegger/nvim-dap",
        config = function(_, opts)
            require("dap-go").setup(opts)
        end
    },

  -- nvim-dap
  { "mfussenegger/nvim-dap" },
 
    -- Plugins Themes 
	{ "joshdick/onedark.vim" },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
 
    -- cmp 
    {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
    {"hrsh7th/cmp-cmdline"}, {"hrsh7th/nvim-cmp"}, 

    -- Mason
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "gopls",
                "yamlls",
                "jsonls",
                "bashls",
                "rust_analyzer",
                "tsserver",
                "lua_ls",
            },
        }, 
    },   

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.1',
        dependencies = {'nvim-lua/plenary.nvim'}
    },

    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },

    -- lualine.nvim
    { "nvim-lualine/lualine.nvim", opts = true },

    -- gitsigns.nvim
    { "lewis6991/gitsigns.nvim" },
})
