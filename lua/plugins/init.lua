return {
    'wbthomason/packer.nvim',
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.5',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',
    "nvim-treesitter/nvim-treesitter-context",
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-repeat',
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
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
    },

    -- trouble shooting plugin
    { "folke/trouble.nvim",              opts = { icons = false } },
    "folke/zen-mode.nvim",
    'tpope/vim-surround',
    'luochen1990/rainbow', -- TODO not working
    -- color scheme
    'sainnhe/sonokai',
    'MathieuTuli/alabaster-contrast',

    'windwp/nvim-ts-autotag',      -- for auto html stuff
    'norcalli/nvim-colorizer.lua', -- for colors (like hex and stuff)

    "nvim-lua/plenary.nvim",
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        ft = "markdown",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "notes",
                    path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
                },
            },
            notes_subdir = "hippo",
            new_notes_location = "notes_subdir",
            conceallevel = 2,
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
            ui = {
                hl_groups = {
                    ObsidianRefText = { underline = true, fg = "#71aed7" },
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#c792ea" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianImportant = { bold = true, fg = "#d73128" },
                    ObsidianBullet = { bold = true, fg = "#71aed7" },
                    ObsidianExtLinkIcon = { fg = "#71aed7" },
                    ObsidianTag = { italic = true, fg = "#71aed7" },
                    ObsidianBlockID = { italic = true, fg = "#71aed7" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            }
        }
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = false,
        version = false,
        opts = {
            -- add any opts here
            provider = "claude",            -- "openai",
            auto_suggestions_provider = "claude",
            cursor_applying_provider = nil, -- The provider used in the applying phase of Cursor Planning Mode, defaults to nil, when nil uses Config.provider as the provider for the applying phase
            claude = {
                endpoint = "https://api.anthropic.com",
                -- model = "claude-3-7-sonnet-20250219",
                model = "claude-3-5-sonnet-20241022",
                temperature = 0,
                max_tokens = 4096,
            },
            openai = {
                endpoint = "https://api.openai.com/v1",
                model = "gpt-4o",             -- your desired model (or use gpt-4o, etc.)
                timeout = 30000,              -- Timeout in milliseconds, increase this for reasoning models
                temperature = 0,
                max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
                --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
            },
            mappings = {
                ask = "<leader>la",
                edit = "<leader>le",
                refresh = "<leader>lr",
                --- @class AvanteConflictMappings
                diff = {
                    ours = "co",
                    theirs = "ct",
                    all_theirs = "ca",
                    both = "cb",
                    cursor = "cc",
                    next = "]x",
                    prev = "[x",
                },
                jump = {
                    next = "]]",
                    prev = "[[",
                },
                submit = {
                    normal = "<CR>",
                    insert = "<C-s>",
                },
                suggestion = {
                    accept = "<M-l>",
                    next = "<M-]>",
                    prev = "<M-[>",
                    dismiss = "<C-]>",
                },
                toggle = {
                    debug = "<leader>ld",
                    hint = "<leader>lh",
                },
            },
            windows = { position = "right" },
        },
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        build = "make",
        -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
        dependencies = {
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            -- "zbirenbaum/copilot.lua", -- for providers='copilot'
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
        },
    },
    -- {
    --     'MathieuTuli/jarvis.nvim',
    --     dependencies = { 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
    -- },
    "itchyny/calendar.vim",
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
    }
}
