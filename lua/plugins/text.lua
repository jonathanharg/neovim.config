return {
    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
    {{'windwp/nvim-autopairs', event = "InsertEnter", opts = {}}},

    {'numToStr/Comment.nvim', opts = {}}, {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        opts = {}
    }, {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    }, {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "mbbill/undotree",
        keys = {"<leader>u", "<cmd>UndotreeToggle<cr>", desc = 'Toggle Undotree'}
    }
}

--     Old text                    Command         New text
-- --------------------------------------------------------------------------------
--     surr*ound_words             ysiw)           (surround_words)
--     *make strings               ys$"            "make strings"
--     [delete ar*ound me!]        ds]             delete around me!
--     remove <b>HTML t*ags</b>    dst             remove HTML tags
--     'change quot*es'            cs'"            "change quotes"
--     <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
--     delete(functi*on calls)     dsf             function calls
