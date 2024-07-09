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
    use('sainnhe/sonokai') -- color scheme
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
        tag = "*",
        ft = "markdown",
        requires = {
            "nvim-lua/plenary.nvim",
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

                -- name new notes starting the ISO datetime and ending with note name
                -- put them in the inbox subdir
                -- note_id_func = function(title)
                    --   local suffix = ""
                    --   -- get current ISO datetime with -5 hour offset from UTC for EST
                    --   local current_datetime = os.date("!%Y-%m-%d-%H%M%S", os.time() - 5*3600)
                    --   if title ~= nil then
                    --     suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    --   else
                    --     for _ = 1, 4 do
                    --       suffix = suffix .. string.char(math.random(65, 90))
                    --     end
                    --   end
                    --   return current_datetime .. "_" .. suffix
                    -- end,

                    -- key mappings, below are the defaults
                mappings = {
                    -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    -- toggle check-boxes
                    -- ["<leader>ch"] = {
                        --   action = function()
                            --     return require("obsidian").util.toggle_checkbox()
                            --   end,
                            --   opts = { buffer = true },
                            -- },
                    },
                    completion = {
                        nvim_cmp = true,
                        min_chars = 2,
                    },
            })
            end
        })
    use({'MathieuTuli/jarvis.nvim',
        requires = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    })
end)
