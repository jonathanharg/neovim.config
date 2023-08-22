return {
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp', -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets'
        }
    }, -- Useful plugin to show you pending keybinds.
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        "folke/tokyonight.nvim",
        lazy = false,    -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        -- config = function() vim.cmd.colorscheme 'tokyonight' end,
    }, { 'folke/which-key.nvim', opts = {} },
    {
        -- Theme inspired by Atom
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function() vim.cmd.colorscheme 'onedark' end
    },
    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        -- See `:help lualine.txt`
        opts = {
            options = {
                -- theme = 'onedark',
                component_separators = '|',
                section_separators = ''
            }
        }
    },
}
