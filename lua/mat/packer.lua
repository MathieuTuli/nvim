-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use("nvim-treesitter/nvim-treesitter-context");


    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('tpope/vim-repeat') -- smart repeats of plugins

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            --- and read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { "neovim/nvim-lspconfig" },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
            -- Snippet
            -- {'L3MON4D3/LuaSnip'},
            -- {'rafamadriz/friendly-snippets'},
        }
    }

    -- trouble shooting plugin
    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use("folke/zen-mode.nvim") -- exactly what it sounds like
    use('tpope/vim-surround')  -- useful for bracket control
    use('luochen1990/rainbow') -- TODO not working
    -- color scheme
    use('sainnhe/sonokai')
    use('MathieuTuli/alabaster-contrast')

    use('windwp/nvim-ts-autotag') -- for auto html stuff
    -- use('jiangmiao/auto-pairs') -- for auto bracket pairs
    use('norcalli/nvim-colorizer.lua') -- for colors (like hex and stuff)

    -- use {
    --     "nvim-neorg/neorg",
    --     rocks = { "lua-utils.nvim", "nvim-nio", "nui.nvim", "plenary.nvim", "pathlib.nvim" },
    --     tag = "*", -- Pin Neorg to the latest stable release
    --     config = function()
    --         require("neorg").setup {
    --             load = {
    --                 ['core.defaults'] = {},
    --                 ['core.concealer'] = {},
    --                 ['core.dirman'] = {
    --                     config = {
    --                         workspaces = {
    --                             notes = "~/notes",
    --                         }
    --                     }
    --                 },
    --             }
    --         }
    --     end,
    -- }

    use("nvim-lua/plenary.nvim")
    use({
        "epwalsh/obsidian.nvim",
        tag = "*",  -- recommended, use latest release instead of latest commit
        ft = "markdown",
        requires = {
            -- Required.
            "nvim-lua/plenary.nvim",

            -- see below for full list of optional dependencies 👇
        },
        config = function()
            require("obsidian").setup({
                workspaces = {
                    {
                        name = "notes",
                        path = "~/notes",
                    },
                },
                notes_subdir = "hippo",
                new_notes_location = "notes_subdir",
                conceallevel=2,
                disable_frontmatter = true,
                templates = {
                    subdir = "templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M:%S",
                },
                mappings = {
                    -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                },
                completion = {
                    nvim_cmp = true,
                    min_chars = 2,
                },

                -- see below for full list of options 👇
            })
        end,
    })
    use({'MathieuTuli/jarvis.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    })
end)
